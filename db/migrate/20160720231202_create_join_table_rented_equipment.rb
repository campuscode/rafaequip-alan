class CreateJoinTableRentedEquipment < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contracts, :equipment, table_name: 'rented_equipment' do |t|
      t.references :contract, foreign_key: true
      t.references :equipment, foreign_key: true
    end
  end
end
