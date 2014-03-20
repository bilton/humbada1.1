require 'spec_helper'

describe "Store front"  do

	it "shows a list of products" do
		product = Product.create!(product_attributes)

		visit store_url

		expect(page).to have_text(product.title)
		expect(page).to have_text(product.description)
		expect(page).to have_text("$5.50")
		expect(page).to have_selector("img[src$='#{product.image_url}']")
	end

end