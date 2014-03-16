class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart

	def subtotal
		quantity * product.price
	end
end
