class TenantSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :dob, :gender, :Krapin, :nationality, :phonenumber, :emailaddress, :currentaddress, :emergencycontact, :idtype, :idnumber, :idexpirydate, :idattachment, :employer, :jobtitle, :monthlyincome, :personalreference, :previouslandlord, :leasestartdate, :leaseenddate, :rentamount, :securitydeposit, :additionalnotes, :landlord_id, :listing_id, :propertyname
end
