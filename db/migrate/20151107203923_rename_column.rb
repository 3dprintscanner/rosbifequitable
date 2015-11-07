class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :parking_references, :latitide, :latitude
  end
end
