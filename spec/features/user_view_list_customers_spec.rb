require 'rails_helper'

feature 'User view customers list' do
  scenario 'successfully' do
    customer = create(:customer)

    visit root_path

    click_on 'Visualizar Clientes'

    expect(page).to have_css('h1', text: 'Clientes')
    expect(page).to have_content('Razão Social')
    expect(page).to have_content('CNPJ')
    expect(page).to have_content('Endereço de cobrança')
    expect(page).to have_content customer.code
    expect(page).to have_content customer.name
    expect(page).to have_content customer.document
    expect(page).to have_content customer.billing_address
    expect(page).to have_content customer.billing_city
    expect(page).to have_content customer.billing_state
    expect(page).to have_content customer.financial_contact
  end
end
