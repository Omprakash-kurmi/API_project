FactoryBot.define do
  factory :order do
    total_amount { 1.5 }
    status { "MyString" }
    association :account, factory: :account
  end
end
