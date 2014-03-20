require 'spec_helper'

describe UsersController  do

	before do
		@user = User.create!(email: 'billt@bill.com', password: 'secret', password_confirmation: 'secret')
	end
	
  context "when not signed in" do
    before do
      session[:user_id] = nil
    end

    it "cannot access index" do
		get :index
		expect(response).to redirect_to(signin_path)
	end

    it "cannot access show" do
		get :edit, id:@user
		expect(response).to redirect_to(signin_path)
	end	

  end

end