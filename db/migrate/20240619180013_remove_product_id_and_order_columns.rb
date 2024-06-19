class RemoveProductIdAndOrderColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :quantity
    remove_column :orders, :product_id
  end
end
