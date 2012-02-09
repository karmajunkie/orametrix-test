class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :hotel_id

      t.timestamps
    end
    add_index :trips, :name, :unique => true

  end
end
