class RemoveStuffFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :quantity, :integer
    remove_column :orders, :product_id, :integer
    add_column :orders, :status, :string
  end
end
