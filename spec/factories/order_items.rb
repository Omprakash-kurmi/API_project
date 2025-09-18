FactoryBot.define do
  factory :order_item do
    price { 1.5 }
    quantity { 1 }
    association :order, factory: :order
    association :product, factory: :product
  end
end
