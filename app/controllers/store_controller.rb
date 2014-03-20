class StoreController < ApplicationController
	before_action :set_cart

	
  def index
  	@products = Product.order(:title)
  end
end
