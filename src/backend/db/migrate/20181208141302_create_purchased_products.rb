class CreatePurchasedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchased_products do |t|
      t.integer :purchase_id, null: false
      t.integer :quantity, null: false, :default => 0
      t.integer :product_id, null: false
      t.timestamps
    end
  end
end
