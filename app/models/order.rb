class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :car
  accepts_nested_attributes_for :customer 
  enum status: { pending: 'pending', confirmed: 'confirmed' , cancelled: 'cancelled' }, _default: 'pending'
   def confirm!
    update(status: :confirmed)
    car.update(available: false)
  end
  def self.ransackable_attributes(auth_object = nil)
    ["car_id", "customer_id", "created_at", "updated_at" , "status"] 
   end
  def self.ransackable_associations(auth_object = nil)
    ["car", "customer"]
  end 
end
