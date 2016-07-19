class Equipment < ApplicationRecord
  validates :customer_code, :description, :supplier,
            :category, :price, :serial_number, :status,
            presence: true
end
