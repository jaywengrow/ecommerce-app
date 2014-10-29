class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def price
    return quantity * product.price
  end
end
