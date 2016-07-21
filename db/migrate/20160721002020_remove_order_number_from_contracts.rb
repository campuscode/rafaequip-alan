class RemoveOrderNumberFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :order_number, :integer
  end
end
