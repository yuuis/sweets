class PurchaseStatus < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases_status do |t|
      t.string :status
      t.timestamps
    end
  end
end
