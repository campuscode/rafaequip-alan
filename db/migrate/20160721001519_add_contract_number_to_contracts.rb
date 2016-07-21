class AddContractNumberToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :contract_number, :string
  end
end
