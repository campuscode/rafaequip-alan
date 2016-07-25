class AddEquipmentCodeToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :equipment_code, :string
  end
end
