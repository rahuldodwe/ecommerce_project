class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :carts
  has_many :orders
  has_many :addresses
  # after_create :send_sign_up_email
  # after_update :send_login_email, if: :saved_change_to_current_sign_in_at?

  # private
  # def send_sign_up_email
  #   UserMailer.sign_up_email(self).deliver_now
  # end

  # def send_login_email
  #   UserMailer.login_email(self).deliver_later
  # end
end
