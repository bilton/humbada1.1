class LineItemsController < ApplicationController
	before_action :set_cart, only: [:create, :destroy, :change_quantity]

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
			redirect_to @cart, notice: "Line Item was successfully created!"
		else
			render :new
		end
	end

	def destroy
		@line_item = LineItem.find(params[:id])
		@line_item.destroy
		redirect_to @cart, alert: 'Line item deleted'
	end

	# def increase_quantity
	# 	@line_item = LineItem.find(params[:line_id])
	# 	current = @line_item.quantity 
	# 	current += 1
	# 	@line_item.quantity = current

	# 	if @line_item.save
	# 	 	redirect_to @cart, notice: "Quantity increased "
	# 	# else
	# 	# 	redirect_to @cart, alert: "Failed to increase"	
	# 	end		
	# end

	# def decrease_quantity
	# 	@line_item = LineItem.find(params[:line_id])
	# 	current = @line_item.quantity 
	# 	current -= 1
	# 	@line_item.quantity = current		

	# 	if @line_item.save
	# 	 	redirect_to @cart, notice: "Quantity decreased "
	# 	 end
	# end

	def change_quantity

		@cart.line_items.each do |line|
			line.quantity = params["quantity_#{line.id}"] 
			line.save
		end

		redirect_to @cart, notice: "Item quantity changed"


	end
end
