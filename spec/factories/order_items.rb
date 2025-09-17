FactoryBot.define do
  factory :order_item do
    price { 1.5 }
    quantity { 1 }
    order { nil }
    product { nil }
  end
end
