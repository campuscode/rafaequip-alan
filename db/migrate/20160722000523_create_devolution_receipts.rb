class CreateDevolutionReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :devolution_receipts do |t|
      t.string :employer
      t.string :customer_document
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
