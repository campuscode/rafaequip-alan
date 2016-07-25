class RentalPeriod < ApplicationRecord
  has_many :prices
  has_many :contracts
end
