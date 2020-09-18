class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :topics, dependent: :destroy
  has_many :recommends, dependent: :destroy
  validates :name, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は12文字までの半角英小文字・数字で構成してください。" }
  validates :introduction, length: { maximum: 50 }
end
