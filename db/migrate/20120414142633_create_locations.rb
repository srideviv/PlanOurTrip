class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.float :popularity
      t.float :latitude
      t.float :longitude
      t.string :description

      t.timestamps
    end
  end
end
