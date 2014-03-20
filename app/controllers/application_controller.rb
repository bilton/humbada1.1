class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  	def set_cart
  		@cart = Cart.find(session[:cart_id])
      if @cart.purchased_at
         @cart.destroy
         session[:cart_id] = nil
      end
  	rescue ActiveRecord::RecordNotFound
  		@cart = Cart.create
  		session[:cart_id] = @cart.id 
  	end

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

  	def require_signin
  		unless current_user
  			session[:intended_url] = request.url
  			redirect_to signin_path, alert: "Need to be signed in as admin to access!!"
  		end 
  	end

end
