class CreateParkingReferences < ActiveRecord::Migration
  def change
    create_table :parking_references do |t|
      t.text :addresse
      t.date :date_maj
      t.boolean :automatique
      t.integer :taux_occup
      t.integer :taux_dispo
      t.text :lien
      t.float :geometryx
      t.float :geometryy

      t.timestamps null: false
    end
  end
end
