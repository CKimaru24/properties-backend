class LandlordSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :email, :phone
end
