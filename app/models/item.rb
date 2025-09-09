class Item < ApplicationRecord
  belongs_to :product, class_name: "Product"

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "quantity", "product_id", "created_at", "updated_at"]
  end

  # Allowlist associations if needed
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
