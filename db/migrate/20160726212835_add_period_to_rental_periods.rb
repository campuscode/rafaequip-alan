class AddPeriodToRentalPeriods < ActiveRecord::Migration[5.0]
  def change
    add_column :rental_periods, :period, :integer
  end
end
