FactoryGirl.define do
  factory :contract do
    contract_number 1
    order_number 1
    customer 'Odebrecht'
    shipping_address 'MyString'
    shipping_contact 'MyString'
    rental_period
    date_begin '2016-07-18 19:57:55'
    date_end '2016-07-18 19:57:55'
    price 1.5
    discount 1.5
    status 'MyString'
  end
end
