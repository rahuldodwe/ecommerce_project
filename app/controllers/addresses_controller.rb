# app/controllers/addresses_controller.rb
class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    order = current_user.orders.find(session[:order_id])
    @address = Address
  end

  def create
  	order = current_user.orders.find(session[:order_id])

    address = Address.create(address_params.merge(user: current_user, order: order))
    if address.save
    redirect_to new_payment_path, notice: "Address saved! Please proceed to payment."
  	else
  		redirect_to new_address_path, notice: "Please Fill the form"
  	end
  end

  private

  def address_params
    params.require(:address).permit(:line1, :line2, :city, :state, :postal_code, :country)
  end
end
