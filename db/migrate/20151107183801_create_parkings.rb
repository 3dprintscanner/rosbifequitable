class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.integer :parking_reference_id
      t.date :date_maj
      t.integer :taux_occup
      t.integer :taux_dispo

      t.timestamps null: false
    end
  end
end
