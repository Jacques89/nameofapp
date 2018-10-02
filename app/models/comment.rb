class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :comments
  scope :rating_desc, -> { order(rating: :desc) }
  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }
  
end
