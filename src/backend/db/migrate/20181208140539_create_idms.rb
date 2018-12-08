class CreateIdms < ActiveRecord::Migration[5.2]
  def change
    create_table :idms do |t|
      t.integer :user_id, null: false
      t.string :value, null: false
      t.timestamps
    end
  end
end
