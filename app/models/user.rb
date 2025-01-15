class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :user_picture

  has_many :carts
  has_many :orders
  has_many :addresses
  has_many :products, through: :order_items

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }

end
