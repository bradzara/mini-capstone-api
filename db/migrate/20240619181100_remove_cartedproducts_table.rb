class RemoveCartedproductsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :cartedproducts
  end
end
