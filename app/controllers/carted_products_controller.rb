class CartedProductsController < ApplicationController

  def create
    if current_user.orders.where(:status => "cart").empty?
      @order = current_user.orders.create(:status => "cart")
    else
      @order = current_user.orders.find_by(:status => "cart")
    end
    @carted_product = @order.carted_products.create(params[:carted_product])
    flash[:success] = "Product added to shopping cart."
    redirect_to root_path
  end

end
