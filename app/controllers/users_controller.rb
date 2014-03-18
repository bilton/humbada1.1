class UsersController < ApplicationController
before_action :require_signin

def index
	@users = User.order(:name)
end

def new
	@user = User.new		
end

def create
	@user = User.new(user_params)

	if @user.save
		redirect_to users_path, notice: "Account of #{@user.email} has been created!"
	else
		render :new
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		redirect_to users_path, notice: "Account successfully updated! "
	else
		render :edit
	end
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to users_path, notice: "Account deleted"
end

private
	def user_params
		require(:user).permit(:email, :password)
	end
end
