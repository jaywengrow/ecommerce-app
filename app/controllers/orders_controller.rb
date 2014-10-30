class OrdersController < ApplicationController



	def destroy
	end

	def edit
	end

	def update
		#process credit card here!

		@order = Order.find(params[:id])
		@order.update(:status => "purchased", :total => @order.total_price)
		flash.now[:success] = "Congrats on saving 5 dollars!"
	end

	def new
		@order = Order.new
	end

	def show	
	end

	def index
	end

end
