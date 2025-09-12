module AccountBlock
  class Account < ApplicationRecord
    self.table_name = :account_block_accounts
    belongs_to :role
  end
end
