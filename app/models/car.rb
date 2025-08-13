class Car < ApplicationRecord
  belongs_to :make
  belongs_to :car_model

  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :description, presence: true
  validates :available, inclusion: { in: [true, false] }
  validates :make_id, presence: true

  has_one_attached :image  
  def self.ransackable_associations(auth_object = nil)
    ["make"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["make_id", "car_model_id", "year", "price", "color", "description", "available", "created_at", "updated_at", "id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["car_model"]
  end
end
