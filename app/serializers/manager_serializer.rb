class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :dob, :idnumber, :phonenumber, :emailaddress, :nssfnumber, :nhifnumber, :krapin, :landlord_id, :listing_id, :propertyname, :idimage
end
