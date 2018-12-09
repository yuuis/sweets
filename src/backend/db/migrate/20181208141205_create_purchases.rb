class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id, null: false
      t.string :status, null: false, :default => "waiting" # success / waiting / failed
      t.timestamps
    end
  end
end
