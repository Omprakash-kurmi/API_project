class Order < ApplicationRecord
  belongs_to :account
  has_many :order_items, class_name: "OrderItem", dependent: :destroy
end
