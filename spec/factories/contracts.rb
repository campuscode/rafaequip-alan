FactoryGirl.define do
  factory :contract do
    contract_number 1
    order_number 1
    customer 'Odebrecht'
    shipping_address 'Al Santos 1293'
    shipping_contact 'João Almeida'
    rental_period
    date_begin '2016-07-21 10:00:00'
    date_end '2016-07-23 18:00:00'
    price 1.5
    discount 1.5
  end
end
