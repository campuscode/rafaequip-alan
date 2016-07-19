class RemoveDateFromContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :date_begin, :datetime
    remove_column :contracts, :date_end, :datetime
  end
end
