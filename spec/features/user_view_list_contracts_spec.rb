require 'rails_helper'

feature 'User View Contracts List' do
  scenario 'successfully' do
    rental_period = create(:rental_period)
    customer = create(:customer)
    contract = create(:contract,
                      rental_period: rental_period,
                      customer: customer)

    login_user
    visit root_path
    click_on 'Visualizar Contratos'

    expect(page).to have_content contract.contract_number
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.shipping_address
    expect(page).to have_content contract.shipping_contact
    expect(page).to have_content contract.rental_period.description
    expect(page).to have_content l(contract.date_begin)
    expect(page).to have_content number_to_currency(contract.total_value)
  end

  scenario 'view empty list' do
    visit root_path
    click_on 'Visualizar Contratos'

    expect(page).to have_content 'Não existem contratos'
  end
end
