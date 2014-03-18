class ProductsController < ApplicationController
	before_action :require_signin, except: [:index, :show]

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to @product, notice: "Product successfully created!"
		else
			render :new
		end
	end

	def edit	
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to @product, notice: "Product successfully updated"
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, alert: "Movie successfully deleted!"
	end

	def who_bought
		@product = Product.find(params[:id])
		@latest_order = @product.orders.order(:updated_at).last
		if stale?(@latest_order)
			respond_to do |format|
				format.atom
			end
		end
	end

	private
		def product_params
			params.require(:product).permit(:title, :description, :price, :image_url)
		end
end
