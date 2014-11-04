require 'rails_helper'

describe Product do
  describe 'sale_message' do
    it 'should return "Sale!" when the price is greater than 30' do
      product = Product.new(:price => 40)
      expect(product.sale_message).to eq("Sale!")
    end

    it 'should return "DISCOUNT ITEM!" when the price is less than 30' do
      product = Product.new(:price => 20)
      expect(product.sale_message).to eq("DISCOUNT ITEM!")
    end

    it 'should return "Sale!" when the price is exactly 30' do
      product = Product.new(:price => 30)
      expect(product.sale_message).to eq("Sale!")
    end
  end

  describe 'sales_tax' do
    it 'should return the sales tax of the product' do
      product = Product.new(:price => 30)
      expect(product.sales_tax).to eq(2.70)
    end
  end

  describe 'total_price' do
    it 'should return base price + sales tax' do
      product = Product.new(:price => 30)
      expect(product.total_price).to eq(32.70)
    end
  end
end