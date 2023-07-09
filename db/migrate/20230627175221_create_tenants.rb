class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :fullname
      t.date :dob
      t.string :gender
      t.string :Krapin
      t.string :nationality
      t.string :phonenumber
      t.string :emailaddress
      t.string :currentaddress
      t.string :emergencycontact
      t.string :idtype
      t.string :idnumber
      t.string :idexpirydate
      t.json :idattachment, default: []
      t.string :employer
      t.string :jobtitle
      t.string :monthlyincome
      t.string :personalreference
      t.string :previouslandlord
      t.date :leasestartdate
      t.date :leaseenddate
      t.string :rentamount
      t.string :securitydeposit
      t.string :additionalnotes
      t.string :propertyname

      t.references :landlord, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
