class AgentSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :dob, :gender, :phonenumber, :emailaddress, :address, :city, :country, :workhistory, :certifications, :education, :marketingexperience, :onlinemarketing, :socialmediapromotion, :communicationskills, :interpersonalskills, :marketingknowledge, :technologyskills, :workinghours, :additionalcomments, :landlord_id, :agreement
end
