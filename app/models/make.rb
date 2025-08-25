class Make < ApplicationRecord
  has_many :cars ,dependent: :destroy
  has_many :car_models, dependent: :destroy
  validates :name, presence: true, uniqueness: true 
  

  def self.ransackable_attributes(auth_object = nil)
    ["name" , "created_at", "updated_at"] 
   end
   
end
