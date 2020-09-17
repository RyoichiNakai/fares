class Topic < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :recommends, dependent: :destroy
end
