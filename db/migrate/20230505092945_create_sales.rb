class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
