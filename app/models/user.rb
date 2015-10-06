class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products

  has_attached_file :avatar, styles: { thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path('nophoto_thumb.png')
  has_attached_file :passport, styles: { thumb: "300x300>" }, default_url: ActionController::Base.helpers.asset_path('nophoto_thumb.png')

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :passport, content_type: /\Aimage\/.*\Z/

  validates_presence_of :first_name, :last_name, :avatar, :passport, if: 'admin?'
  validates_presence_of :shop_name, if: 'seller?'

  validates :password, length: { within: 6..128 },  if: 'guest?'
  validates :password, length: { within: 8..128 },  if: 'seller?'
  validates :password, length: { within: 10..128 }, if: 'admin?'

  def admin?
    role == "admin"
  end

  def seller?
    role == "seller"
  end

  def guest?
    role == "guest"
  end
end
