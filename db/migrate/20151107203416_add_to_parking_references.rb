class AddToParkingReferences < ActiveRecord::Migration
  def change
  	add_column :parking_references, :open, :boolean
  end
end
