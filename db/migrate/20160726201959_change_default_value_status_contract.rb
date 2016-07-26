class ChangeDefaultValueStatusContract < ActiveRecord::Migration[5.0]
  def change
    change_column_default :contracts, :status, from: nil, to: 'Em aberto'
  end
end
