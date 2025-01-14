class Order < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :feedbacks
  has_many :products, through: :order_items

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
