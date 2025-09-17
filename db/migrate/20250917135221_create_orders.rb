class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders, if_not_exists: true do |t|
      t.float :total_amount
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
