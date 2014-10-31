class ProductsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy]

	def create
		@product = Product.new(params[:product])
		if @product.save
			flash[:success] = "Product Succesfully Added."
			redirect_to product_path(@product.id)
		else
			render 'new'
		end
	end

	def kylestore
	end

	def index
		@products = Product.all
		@products = @products.where("price < ?" , 2) if params[:products] == "sale_products"
		@products = Product.joins(:categories).where("categories.name =?", params[:category]) if params[:category]

		@categories = Category.all


	end

	#def random
		#@product = Product.rand #if params[:product] == "random_product"
		#render 'show'
	#end
	

	def edit
		@product = Product.find_by(:id => params[:id])
	end

	def show
		@carted_product = CartedProduct.new

		if params[:id] == "random"
			product = Product.all
			@product = product.sample

		else	
			@product = Product.find_by(:id => params[:id])
		end
	end

	def new
		@product = Product.new
	end

	def update
		@product = Product.find_by(:id => params[:id])
		@product.update(params[:product])
		flash[:info] = "Product Succesfully Modified."
		redirect_to @product
		#redirect_to "/products/#{@product.id}"
		#another way to return to the product's individual page
	end

	def destroy
		@product = Product.find_by(:id => params[:id])
		@product.destroy
		flash[:danger] = "Product Deleted."
		redirect_to products_path #"/products"

	end
end
