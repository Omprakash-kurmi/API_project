class Product < ApplicationRecord
  has_many :items, class_name: 'Item', dependent: :destroy
  has_many :order_items, class_name: "OrderItem", dependent: :destroy
  has_many_attached :images
  belongs_to :category
  validates :name, presence: true
  scope :cheap, -> { where("price < 100") }
  # default_scope { where(stock: 3) }
  scope :by_name, ->(name) { where(name: name) }
  # accepts_nested_attributes_for: :items, allow_destroy: true
end
  