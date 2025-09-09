class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price, default: 0.0
      t.integer :stock

      t.timestamps
    end
  end
end
