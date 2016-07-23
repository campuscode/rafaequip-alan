require 'rails_helper'

feature 'User View Contracts List' do
  scenario 'successfully' do
    rental_period = create(:rental_period)
    contract = create(:contract, rental_period: rental_period)
    visit root_path
    click_on 'Visualizar contratos'

    expect(page).to have_content contract.contract_number
    expect(page).to have_content contract.order_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.shipping_address
    expect(page).to have_content contract.shipping_contact
    expect(page).to have_content contract.rental_period.description
    expect(page).to have_content contract.date_begin
    expect(page).to have_content contract.date_end
    expect(page).to have_content contract.price
    expect(page).to have_content contract.discount
  end
end
