class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order
  
  validates :rating, presence: true, inclusion: { in: 1..5 } # Rating between 1 and 5
  validates :comment, presence: true
end
