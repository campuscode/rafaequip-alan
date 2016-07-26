class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.integer :code
      t.string :name
      t.string :document
      t.string :billing_address
      t.string :billing_city
      t.string :billing_state
      t.string :billing_zipcode
      t.string :financial_contact

      t.timestamps
    end
  end
end
