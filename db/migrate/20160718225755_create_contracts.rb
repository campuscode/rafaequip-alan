class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.integer :contract_number
      t.integer :order_number
      t.string :customer
      t.string :shipping_address
      t.string :shipping_contact
      t.string :rental_period
      t.string :rented_equipments
      t.datetime :date_begin
      t.datetime :date_end
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
