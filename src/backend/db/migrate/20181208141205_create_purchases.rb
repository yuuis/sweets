class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :status, null: false, :default => 0 # 0: waiting, 1: success, 2: failed
      t.timestamps
    end
  end
end
