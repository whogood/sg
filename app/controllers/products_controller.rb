class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :toggle_pro]
  before_action :authenticate_user!,  except: [:show, :index]
  before_action :check_seller_rights, except: [:show, :index, :toggle_pro]
  before_action :check_admin_rights,  only: [:toggle_pro]

  def index
    @products = user_signed_in? ? Product.all : Product.not_pro
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  def toggle_pro
    @product.is_pro = !@product.is_pro
    @product.save
    redirect_to product_url params[:id]
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :photo, :user_id)
    end

    def check_seller_rights
      unless current_user.seller?
        redirect_to root_url, alert: "You cannot access"
      end
    end

    def check_admin_rights
      unless current_user.admin?
        redirect_to root_url, alert: "You cannot access"
      end
    end
end
