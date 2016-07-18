class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :customer_code
      t.string :description
      t.string :category
      t.float :price
      t.string :serial_number
      t.string :status

      t.timestamps
    end
  end
end
