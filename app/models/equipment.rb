class Equipment < ApplicationRecord
  validates :customer_code, :description, :category, :price, :serial_number, :status, presence: true
end
