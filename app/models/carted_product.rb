class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def price
    return product.price * quantity
  end
end
