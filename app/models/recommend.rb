class Recommend < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  attachment :image
end
