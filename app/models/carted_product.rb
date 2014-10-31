class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, :presence => true

  def price
    return quantity * product.price
  end
end
