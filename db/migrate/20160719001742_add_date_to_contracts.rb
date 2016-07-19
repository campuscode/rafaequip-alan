class AddDateToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :date_begin, :date
    add_column :contracts, :date_end, :date
  end
end
