class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  # Allowlist attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id", "email", "created_at", "updated_at"]
  end

  # Optionally allowlist associations if any
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
