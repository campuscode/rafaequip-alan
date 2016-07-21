class AddOrderNumberToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :order_number, :string
  end
end
