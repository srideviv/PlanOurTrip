class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer :trip_id
      t.integer :location_id
      t.integer :order
      t.references :trip
	  t.references :location
      t.timestamps
    end
  end
end
