class CartedProductsController < ApplicationController
  before_action :authenticate_user!#, :except => [:index, :create]

  def index
    @order = Order.find_by(:user_id => current_user.id, :status => "cart")
    @carted_products = @order.carted_products
  end

  def create
    if Order.find_by(:user_id => current_user.id, :status => "cart")
      @order = Order.find_by(:user_id => current_user.id, :status => "cart")
    else
      @order = Order.create(:status => "cart", :user_id => current_user.id)
    end
    CartedProduct.create(params[:carted_product].merge({:order_id => @order.id}))
    flash[:success] = "Added to cart."
    redirect_to "/"
  end
end
