class Equipment < ApplicationRecord
  has_many :prices
  validates :equipment_code, :description, :supplier,
            :category, :price, :serial_number,
            presence: true
  has_many :contracts
end
