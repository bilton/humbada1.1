class StoreController < ApplicationController
	before_action :set_cart 

	
  def index
  	@products = Product.order(:title)
  end

  def story
  	# this is the controller for the "Our Story Link"
  end

  def contact
  	# this is the controller for the "contacts" link
  end
end
