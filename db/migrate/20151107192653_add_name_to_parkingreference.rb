class AddNameToParkingreference < ActiveRecord::Migration
  def change
  	add_column :parking_references, :name, :string
  	add_column :parking_references, :number, :string
  end
end
