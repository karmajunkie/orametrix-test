class CreateHotels < ActiveRecord::Migration
  def up
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :hotels
  end
end
