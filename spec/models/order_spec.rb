require 'rails_helper'

describe Order do

  describe "total_price" do
    it "should return the total price of all the carted products associated with this order" do
      product = Product.create!(:price => 10.0, :name => "Basketball")
      product_2 = Product.create(:price => 1000.0, :name => "Sword")
      order = Order.create(:status => "purchased")
      carted_product = CartedProduct.create!(:product_id => product.id, :quantity => 3, :order_id => order.id)
      carted_product_2 = CartedProduct.create!(:product_id => product_2.id, :quantity => 2, :order_id => order.id)

      expect(order.total_price).to eq(2030.0)
    end
  end

  describe "refund!" do
    it "should change the status to 'refunded'" do
      order = Order.create(:status => "purchased")

      order.refund!

      expect(order.status).to eq("refunded")
    end


  end


end