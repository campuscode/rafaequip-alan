class Equipment < ApplicationRecord
  has_many :prices
  validates :customer_code, :description, :supplier,
            :category, :price, :serial_number, :status,
            presence: true
end
