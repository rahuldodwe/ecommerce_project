class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category, optional: true
  has_many :cart_items
  
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
