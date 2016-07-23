class AddStatusToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :status, :string
  end
end
