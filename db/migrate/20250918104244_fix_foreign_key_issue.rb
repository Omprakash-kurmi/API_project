class FixForeignKeyIssue < ActiveRecord::Migration[7.1]
 def change
    create_table :orders, if_not_exists: true do |t|
      t.references :account, null: false, foreign_key: { to_table: :account_block_accounts }
      t.string :status
      t.timestamps
    end
  end
end
