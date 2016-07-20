class Price < ApplicationRecord
  belongs_to :rental_period
  belongs_to :equipment
end
