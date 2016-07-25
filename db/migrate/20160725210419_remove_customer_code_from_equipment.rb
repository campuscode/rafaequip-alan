class RemoveCustomerCodeFromEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :customer_code, :string
  end
end
