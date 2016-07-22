require 'rails_helper'

feature 'User View Contracts List' do
  scenario 'successfully' do
    contract = create(:contract)
    visit root_path
    click_on 'Visualizar contratos'

    expect(page).to have_content contract.contract_number
    expect(page).to have_content contract.order_number
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.shipping_address
    expect(page).to have_content contract.shipping_contact
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.date_begin
    expect(page).to have_content contract.date_end
    expect(page).to have_content contract.price
    expect(page).to have_content contract.discount
  end
end
