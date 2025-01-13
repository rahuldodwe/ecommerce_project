class Order < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
