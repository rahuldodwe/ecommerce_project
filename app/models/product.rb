class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category, optional: true
  has_many :cart_items
  has_many :orders, through: :order_items
  has_many :feedbacks
  
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def average_rating
    feedbacks.average(:rating).to_f.round(2)
  end
end
