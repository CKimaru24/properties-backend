class ListingSerializer < ActiveModel::Serializer
  attributes :id, :listingType, :town, :name, :listingStatus, :priceFrom, :priceUpTo, :bedrooms, :landlord_id, :bathrooms, :images
end
