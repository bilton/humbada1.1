class OrdersController < ApplicationController
	before_action :set_cart, only: [:new, :create, :show]

	def index
		@orders = Order.order("created_at asc")
	end

	def show
		@order = Order.find_by(params[:id])
	end

	def new
		if @cart.line_items.empty?
			redirect_to store_url, notice: "Your cart is empty"
		end	

		@order = Order.new
	end

	def create
		@order = Order.new(order_params)

		@cart.line_items.each do |item|
			item.cart_id = nil
			@order.line_items << item
		end

		if @order.save
			Cart.find(session[:cart_id]).destroy		# Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to store_url, notice: "Thank you for your order."
		else
			render :new
		end
	end

private
	def order_params
		params.require(:order).permit(:name, :address, :email, :pay_type)		
	end	
end
