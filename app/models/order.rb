class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :car
  accepts_nested_attributes_for :customer 
end
