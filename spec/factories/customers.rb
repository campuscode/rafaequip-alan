FactoryGirl.define do
  factory :customer do
    code 1
    name 'Odebretchetche'
    document '98.876.765/00001-21'
    billing_address 'Alameda Santos, 1000'
    billing_city 'São Paulo'
    billing_state 'SP'
    billing_zipcode '04589-000'
    financial_contact 'Janderson Nunes Silva'
  end
end
