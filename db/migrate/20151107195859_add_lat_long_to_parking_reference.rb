class AddLatLongToParkingReference < ActiveRecord::Migration
  def change
  	add_column :parking_references, :latitide, :float
  	add_column :parking_references, :longitude, :float
  end
end
