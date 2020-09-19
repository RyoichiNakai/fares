class Recommender < ApplicationRecord
  belongs_to :user
  validates :real_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
