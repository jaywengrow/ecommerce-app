class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, :presence => true

  def price
    return quantity * product.price
  end

  def update_quantity(new_quantity)
    update(:quantity => new_quantity)
  end
end
