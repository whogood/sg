class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: ActionController::Base.helpers.asset_path('nophoto_thumb.png')
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
