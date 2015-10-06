class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource(role: "guest")
  end

  def seller
    build_resource(role: "seller")
    render "new"
  end

  def admin
    build_resource(role: "admin")
    render "new"
  end

  private

  def sign_up_params
    params.require(:user).permit(:role, :first_name, :last_name, :avatar, :passport, :birthday, :shop_name, :email, :password, :password_confirmation)
  end

end
