class Landlord < ApplicationRecord
    validates :fname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should have letters only" }
    validates :lname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should have letters only" }
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "has an invalid format" }
    validates :phone, presence: true, format: { with: /\A0\d{9}\z/, message: "should start with 0 and have 10 digits" }
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+\z/, message: "should have at least one uppercase letter, one lowercase letter, one digit, and one symbol" }
    validates :password_confirmation, presence: true

    # has_secure_password
  
    # Other model code
end
  
