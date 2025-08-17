class Customer < ApplicationRecord
  belongs_to :city
  has_many :orders
  validates :name, presence: true
  validates :email, presence: true , format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
   def self.ransackable_attributes(auth_object = nil)
    ["name", "email", "phone_number", "city_id", "created_at", "updated_at"] 
   end
  def self.ransackable_associations(auth_object = nil)
    ["city", "orders"]
  end 
end
