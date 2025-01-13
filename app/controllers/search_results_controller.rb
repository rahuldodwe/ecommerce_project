class SearchResultsController < ApplicationController
	def index
    if params[:query].present?
      @search_products = Product.where("LOWER(name) LIKE ?", "%#{params[:query]}%")
      redirect_to search_result_path(@search_products)
    else
      @products = Product.all
    end
	end
end
