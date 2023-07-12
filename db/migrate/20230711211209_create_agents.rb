class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :fullname
      t.string :dob
      t.string :gender
      t.string :phonenumber
      t.string :emailaddress
      t.string :address
      t.string :city
      t.string :country
      t.string :workhistory
      t.string :certifications
      t.string :education
      t.string :marketingexperience
      t.string :onlinemarketing
      t.string :socialmediapromotion
      t.string :communicationskills
      t.string :interpersonalskills
      t.string :marketingknowledge
      t.string :technologyskills
      t.string :workinghours
      t.string :additionalcomments
      t.string :agreement

      t.references :landlord, foreign_key: true

      t.timestamps
    end
  end
end
