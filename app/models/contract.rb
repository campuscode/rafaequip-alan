class Contract < ApplicationRecord
  validates :contract_number, :customer, :shipping_address, :rental_period,
            :shipping_contact, :date_begin, :date_end,
            :price, :discount, presence: true

  has_one  :delivery_receipt
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
end
