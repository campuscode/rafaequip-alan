class Price < ApplicationRecord
  validates :amount, :equipment_id, :rental_period_id, presence: true
  belongs_to :rental_period
  belongs_to :equipment
end
