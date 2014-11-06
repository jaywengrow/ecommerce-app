require 'rails_helper'

describe CartedProduct do
  describe "price" do
    it "should return the quantity multiplied by the price of the product" do
      product = Product.create!(:price => 10.0, :name => "Basketball")
      carted_product = CartedProduct.create!(:product_id => product.id, :quantity => 3)

      expect(carted_product.price).to eq(30.0)
    end
  end

  describe "update_quantity" do
    it "should update the quantity of a carted product by the specified number" do
      product = Product.create!(:price => 10.0, :name => "Basketball")
      carted_product = CartedProduct.create!(:product_id => product.id, :quantity => 3)

      carted_product.update_quantity(1)

      expect(carted_product.quantity).to eq(1)
    end
  end

end

