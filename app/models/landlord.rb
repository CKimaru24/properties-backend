class Landlord < ApplicationRecord
    # validates :fname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should have letters only" }
    # validates :lname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should have letters only" }
    # validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "has an invalid format" }
    # validates :phone, presence: true, format: { with: /\A0\d{9}\z/, message: "should start with 0 and have 10 digits" }
    # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    # validates :password, presence: true, length: { minimum: 8 }, confirmation: true
    # validates :password_confirmation, presence: true

    has_secure_password

    has_many :listings
    has_many :tenants
    has_many :managers
  
end
  
