class Manager < ApplicationRecord
    belongs_to :landlord
    belongs_to :listing
end
