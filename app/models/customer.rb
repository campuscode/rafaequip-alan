class Customer < ApplicationRecord
  validates :code,
            :name,
            :document,
            :billing_address,
            :billing_city,
            :billing_state,
            :billing_zipcode,
            :financial_contact,
            presence: true

  has_many :contracts
end
