class Make < ApplicationRecord
  has_many :cars ,dependent: :destroy
  has_many :car_models, dependent: :destroy
  validates :name, presence: true, uniqueness: true 
end
