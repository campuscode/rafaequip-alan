FactoryGirl.define do
  factory :equipment do
    equipment_code 'FRTMKT001'
    description 'Martelete Rotativo Hr2470 Makita 220v'
    supplier 'Makita'
    category 'Furadeira Martelete'
    price 585.80
    serial_number '123456'
    status 'available'

    trait :unavailable do
      description 'unavailable'
      status 'unavailable'
    end

    trait :maintenance do
      description 'maintenance'
      status 'maintenance'
    end
  end
end
