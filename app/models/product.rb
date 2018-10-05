class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, presence: true
  validates :price, presence: true

  def price_show
    "€ %.2f" % (self[:price]/100.0)
  end

  def self.search(search_term)
   Product.where("name LIKE ?", "%#{search_term}%")
  end

# Called by <%= @product.highest_rating_comment %>
  def highest_rating_comment
   comments.rating_desc.first
 end

 def average_rating
  comments.average(:rating).to_f
 end
end
