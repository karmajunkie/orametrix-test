class AddRateToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :rate, :float
  end
end
