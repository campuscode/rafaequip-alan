class RemoveRentalPeriodStringFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :rental_period, :string
  end
end
