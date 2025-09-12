class CreateAccountBlockAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :account_block_accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email
      t.string :full_phone_number
      t.string :password
      t.integer :role_id

      t.timestamps
    end
  end
end
