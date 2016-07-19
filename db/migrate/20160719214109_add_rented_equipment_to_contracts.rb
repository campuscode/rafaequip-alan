class AddRentedEquipmentToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :rented_equipment, :string
  end
end
