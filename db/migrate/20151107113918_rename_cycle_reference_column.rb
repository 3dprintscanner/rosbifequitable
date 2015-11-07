class RenameCycleReferenceColumn < ActiveRecord::Migration
  def change
  	rename_column :cycles, :reference_id, :cycle_reference_id
  end
end
