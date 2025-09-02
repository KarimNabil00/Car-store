class CarModel < ApplicationRecord
  belongs_to :make
  has_many :cars, dependent: :destroy
  validates :name, presence: true
  

  
  def self.ransackable_attributes(auth_object = nil)
    ["name", "make_id", "created_at", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["make", "cars"]
  end
end
