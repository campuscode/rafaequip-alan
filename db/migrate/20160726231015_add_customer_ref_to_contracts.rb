class AddCustomerRefToContracts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contracts, :customer, foreign_key: true
  end
end
