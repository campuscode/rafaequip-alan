class RemoveAvailableFromEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :available, :boolean
  end
end
