class AddDateToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :date, :datetime
  end
end
