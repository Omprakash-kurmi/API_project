class Product < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true
  scope :cheap, -> { where("price < 100") }
  # default_scope { where(stock: 3) }
  scope :by_name, ->(name) { where(name: name) }
  # accepts_nested_attributes_for: :items, allow_destroy: true
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "price", "stock", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["items"]
  end
end
