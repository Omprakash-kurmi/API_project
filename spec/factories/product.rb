require 'faker'

FactoryBot.define do
  factory :product, class: "Product" do 
    name { Faker::Name.name }
    description { "this is best product in my company" }
    stock { 200 }
    price { 22.22 }
    association :category, factory: :category
  end
end