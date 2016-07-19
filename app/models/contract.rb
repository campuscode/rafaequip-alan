class Contract < ApplicationRecord
  validates :contract_number, :customer,
  :shipping_address, :rental_period, :shipping_contact, :rented_equipments, :date_begin, :date_end, :price, :discount, presence: true
end
