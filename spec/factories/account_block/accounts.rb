FactoryBot.define do
  factory :account, class: 'AccountBlock::Account' do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name }
    email {Faker::Internet.unique.email}
    association :role, factory: :role 
    full_phone_number {"918765432189"}
    password   { "password123" }
  end
end
