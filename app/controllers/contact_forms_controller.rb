class ContactFormsController < ApplicationController
before_action :set_cart

	def new
		
	end

	def create
	    @contact = {
	      name: params[:name], 
	      email: params[:email], 
	      message: params[:message]
	    }
	    ContactForm.contacting(@contact).deliver!
	    redirect_to new_contact_forms_path 
	    flash[:notice] = "Your message has been sent!"		
	end

end
