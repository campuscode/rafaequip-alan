class RemoveStatusFromEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :status, :boolean
  end
end
