class Category < ApplicationRecord
  has_one_attached :image
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  has_many :products
  
  validates :name, presence: true, uniqueness: { scope: :parent_id }
end
