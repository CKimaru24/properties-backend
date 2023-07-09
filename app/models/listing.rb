class Listing < ApplicationRecord
    belongs_to :landlord
    has_many :tenants
    has_many :managers
end
