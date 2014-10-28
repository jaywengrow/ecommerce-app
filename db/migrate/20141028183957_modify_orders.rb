class ModifyOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :integer
    add_column :orders, :status, :string
  end
end
