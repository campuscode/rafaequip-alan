class RemoveContractNumberFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :contract_number, :integer
  end
end
