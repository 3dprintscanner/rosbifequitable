class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.string :status
      t.integer :bike_stands
      t.integer :available_bike_stands
      t.integer :available_bikes
      t.integer :reference_id

      t.timestamps null: false
    end
  end
end
