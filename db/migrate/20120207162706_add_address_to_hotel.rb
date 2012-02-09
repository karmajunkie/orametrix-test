class AddAddressToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :address, :string
  end
end
