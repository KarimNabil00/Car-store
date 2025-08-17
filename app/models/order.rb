class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :car
  accepts_nested_attributes_for :customer 
   def self.ransackable_attributes(auth_object = nil)
    ["car_id", "customer_id", "created_at", "updated_at"] 
   end
  def self.ransackable_associations(auth_object = nil)
    ["car", "customer"]
  end 
end
