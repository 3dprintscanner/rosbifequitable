class AddNumberAndContractToReference < ActiveRecord::Migration
  def change
  	add_column :cycle_references, :number, :integer
  	add_column :cycle_references, :contract_name, :string
  end
end
