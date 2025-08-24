class Customer < ApplicationRecord
  belongs_to :city
  has_many :orders , dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false } , format: { with: URI::MailTo::EMAIL_REGEXP }
  phony_normalize :phone_number , default_country_code: 'EG'
  validates :phone_number, presence: true , phony_plausible: true
  validates :city_id, presence: true

  before_create :generate_confirmation_token

  def confirm_email!
    update(email_confirmed: true, confirm_token: nil)
  end
  def send_confirmation_email(order)
    CustomerMailer.confirmation_email(self, order).deliver_later
  end
  private

  def generate_confirmation_token
    self.confirm_token ||= SecureRandom.urlsafe_base64
  end
   def self.ransackable_attributes(auth_object = nil)
    ["name", "email", "phone_number", "city_id", "created_at", "updated_at" , "email_confirmed"] 
   end
  def self.ransackable_associations(auth_object = nil)
    ["city", "orders"]
  end 
end
