class CartsController < ApplicationController
	before_action :set_product, only: [:create, :destroy]
	def create
		if !@current_cart
			@current_cart = Cart.create 
      session[:current_cart_id] = @current_cart.secret_id
		end
		@current_cart.cart_items.create(product_id: params[:product_id])
		redirect_to "/" , notice: "Product Added to cart"
	end

	def show
	end

	def destroy
		@cart_item = @current_cart.cart_items.find_by_product_id(@product.id)
		if @cart_item.destroy
			redirect_to cart_path, notice: "Product Removed from Cart"
		end
	end

	private
	def set_product
		@product = Product.find(params[:product_id])
	end
end