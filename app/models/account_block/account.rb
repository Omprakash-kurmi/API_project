module AccountBlock
  class Account < ApplicationRecord
    self.table_name = :account_block_accounts
    belongs_to :role
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, :last_name, :full_phone_number, presence: true
  end
end
