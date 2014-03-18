class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome back #{user.email}"
			redirect_to (session[:intended_url] || store_url)
			session[:intended_url] = nil 
		else
			flash.now[:alert] = "Invalid email/password combination"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to store_url, notice: "You're now signed out!! "
	end
end

