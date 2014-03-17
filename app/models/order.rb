class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	has_many :products, through: :line_items

	PAYMENT_METHOD = ['Paypal', 'Internet banking transfer', 'Cash on delivery']

	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_METHOD

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil 					# unsure why I need this one
			line_items << item
		end
	end

end
