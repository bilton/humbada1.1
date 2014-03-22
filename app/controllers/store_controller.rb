class StoreController < ApplicationController
	before_action :set_cart 

	
  def index
  	@products = Product.order(:title)
  end

  def story
  	# this is the controller for the "Our Story Link"
  end

  def contact_view
    # this is the controller for the "contacts" link
  end

  def contact
  	# this is the controller to submit message in the contact form
    
    @contact = {
      name: params[:name], 
      email: params[:email], 
      message: params[:message]
    }
    ContactForm.contacting(@contact).deliver!
    flash[:notice] = "Your message has been sent!"
  end
end
