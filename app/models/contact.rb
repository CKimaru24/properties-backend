class Contact < ApplicationRecord
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "should have letters only" }
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "has an invalid format" }
    validates :phone, presence: true, format: { with: /\A0\d{9}\z/, message: "should start with 0 and have 10 digits" }
    validates :message, presence: true
end
  