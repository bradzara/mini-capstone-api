class CreateCartedproducts < ActiveRecord::Migration[7.1]
  def change
    create_table :cartedproducts do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.string :status
      t.integer :order_id

      t.timestamps
    end
  end
end
