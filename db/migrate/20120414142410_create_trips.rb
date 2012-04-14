class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.float :distance
      t.datetime :drive_time

      t.timestamps
    end
  end
end
