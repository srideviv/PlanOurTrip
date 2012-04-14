class CreateTourists < ActiveRecord::Migration
  def change
    create_table :tourists do |t|
      t.integer :trip_id
      t.integer :user_id
      t.string :role
	
	  t.references :user
	  t.references :trip	
      t.timestamps
    end
  end
end
