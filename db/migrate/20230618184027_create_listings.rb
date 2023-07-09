class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :listingType
      t.string :town
      t.string :name
      t.string :listingStatus
      t.string :priceFrom
      t.string :priceUpTo
      t.integer :bedrooms
      t.integer :bathrooms
      t.json :images, default: []

      t.references :landlord, foreign_key: true

      t.timestamps
    end
  end
end
