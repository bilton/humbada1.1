class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	belongs_to :order

	def subtotal
		quantity * product.price
	end
end
