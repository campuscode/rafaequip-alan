class RemoveRentedEquipmentsFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :rented_equipments, :string
  end
end
