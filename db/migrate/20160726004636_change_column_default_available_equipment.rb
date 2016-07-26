class ChangeColumnDefaultAvailableEquipment < ActiveRecord::Migration[5.0]
  def change
    change_column_default :equipment, :available, from: nil, to: true
  end
end
