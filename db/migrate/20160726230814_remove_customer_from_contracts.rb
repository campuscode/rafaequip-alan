class RemoveCustomerFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :customer, :string
  end
end
