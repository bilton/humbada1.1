class LineItemsController < ApplicationController
	before_action :set_cart, only: [:create]

	def create
		@product = Product.find(params[:product_id])

		current_item = @cart.line_items.find_by(product_id: @product)
		if current_item
			current_item.quantity += 1
		else
			current_item = @cart.line_items.build(product: @product)
		end
		@line_item = current_item

		if @line_item.save
			session[:counter] = 0
			redirect_to @cart, notice: "Line Item was successfully created!"
		else
			render :new
		end
	end
end
