class Car < ApplicationRecord
  has_one_attached :image  
  def self.ransackable_attributes(auth_object = nil)
    ["make", "model", "year", "price", "color", "description", "available", "created_at", "updated_at", "id"]
  end
end
