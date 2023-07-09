class CreateLandlords < ActiveRecord::Migration[7.0]
  def change
    create_table :landlords do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      # t.string :password
      # t.string :password_confirmation
      t.string :password_digest

      t.timestamps
    end
  end
end

