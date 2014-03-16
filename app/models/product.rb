class Product < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: /\w+.(gif|jpg|png)/i,
		message: "must reference a gif, jpg or png image"
	}

	def self.latest
		Product.order("updated_at desc")
	end
end
