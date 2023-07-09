class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :fullname
      t.string :dob
      t.integer :idnumber
      t.string :phonenumber
      t.string :emailaddress
      t.string :nssfnumber
      t.string :nhifnumber
      t.string :krapin
      t.string :propertyname
      t.json :idimage, default: []

      t.references :landlord, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
