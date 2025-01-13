class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def new
    @cart_items = @current_cart.cart_items.includes(:product)
    @total_price = @cart_items.sum { |item| item.product.price }
    @address = Address.new
  end

  def create
    cart_items = @current_cart.cart_items.includes(:product)

    if cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty. Please add products to checkout."
      return
    end

    order = create_order(cart_items)
    session[:order_id] = order.id
    redirect_to new_address_path, notice: "Please provide your shipping and billing address."
  end

  # Direct Buy Action
  def direct_buy
    product = Product.find(params[:product_id])
    # Create an order for the "Buy Now" action
    order = current_user.orders.create!(
      total_price: product.price
    )
    # Add the product to the order
    order.order_items.create!(
      product: product,
      price: product.price
    )

    # Store order ID in session
    session[:order_id] = order.id

    # Redirect to the address form
    redirect_to new_address_path, notice: "Please provide your shipping"
  end

  private

  def create_order(cart_items)
    order = current_user.orders.create!(
      total_price: cart_items.sum { |item| item.product.price }
    )

    cart_items.each do |cart_item|
      order.order_items.create!(
        product: cart_item.product,
        price: cart_item.product.price
      )
    end

    order
  end
end
