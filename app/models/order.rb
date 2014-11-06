class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, :through => :carted_products
	belongs_to :user

  def total_price
    price = 0
    carted_products.each do |carted_product|
      price += carted_product.price
    end
    return price
  end

  def refund!
    update(:status => "refunded")
  end

end
