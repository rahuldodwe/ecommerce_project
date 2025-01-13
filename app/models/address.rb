# app/models/address.rb
class Address < ApplicationRecord
  belongs_to :user
  belongs_to :order
  
  validates :line1, :city, :state, :postal_code, :country, presence: true
end
