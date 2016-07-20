class RentedEquipment < ApplicationRecord
  self.table_name = 'rented_equipment'
  belongs_to :contract
  belongs_to :equipment
end
