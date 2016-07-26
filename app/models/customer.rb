class Customer < ApplicationRecord
  validates :code,
            :name,
            :document,
            :billing_address,
            :billing_city,
            :billing_state,
            :billing_zipcode,
            presence: true
end
