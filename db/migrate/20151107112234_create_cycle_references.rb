class CreateCycleReferences < ActiveRecord::Migration
  def change
    create_table :cycle_references do |t|
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
