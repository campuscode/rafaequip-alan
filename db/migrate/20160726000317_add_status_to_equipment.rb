class AddStatusToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :available, :boolean
  end
end
