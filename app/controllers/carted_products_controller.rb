class CartedProductsController < ApplicationController

  def create
    current_user.orders.create(:status => "cart") unless current_user.orders.where(:status => "cart").any?
    redirect_to root_path

  end

end
