class Product < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: ActionController::Base.helpers.asset_path('nophoto_thumb.png')
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  scope :not_pro,  -> { where(is_pro: false) }

  def user_shop_name
    user.shop_name if user
  end
end
