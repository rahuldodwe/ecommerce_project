class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_user.orders.find(session[:order_id])
  end

  def create
    @order = current_user.orders.find(session[:order_id])
    if @order.save
      session[:order_id] = nil
      redirect_to order_path(@order), notice: "Payment successful! Your order has been placed."
    else
      redirect_to new_payment_path , notice: "Please Make a Payment."
    end
    
  end
end
