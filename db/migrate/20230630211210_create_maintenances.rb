class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.string :item
      t.string :details
      t.json :images, default: []

      t.timestamps
    end
  end
end
