class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password , presence: true ,confirmation: true 
  # if you want to return colletion use self.
  # scoops
end
