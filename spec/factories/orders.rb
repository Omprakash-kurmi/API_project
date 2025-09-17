FactoryBot.define do
  factory :order do
    total_amount { 1.5 }
    status { "MyString" }
    account { nil }
  end
end
