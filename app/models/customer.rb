class Customer < ApplicationRecord
  belongs_to :city
  has_many :orders
  validates :name, presence: true
  validates :email, presence: true , format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
end
