module AccountBlock
  class Role < ApplicationRecord
    self.table_name = :account_block_roles
    has_many :accounts, class_name: 'AccountBlock::Account', dependent: :destroy
  end
end
