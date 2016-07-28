require 'rails_helper'

feature 'User generate delivery receipt' do
  scenario 'successfully' do
    contract = create(:contract)

    login_user
    visit contract_path contract

    click_on 'Gerar Recibo de Entrega'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content(contract.contract_number)
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.shipping_address)
    expect(page).to have_content(contract.shipping_contact)
    expect(page).to have_content(contract.rental_period.description)
  end

  scenario 'receipt exists' do
    contract = create(:contract)
    contract.create_delivery_receipt

    login_user
    visit contract_path contract

    click_on 'Visualizar Recibo de Entrega'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content(contract.contract_number)
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.shipping_address)
    expect(page).to have_content(contract.shipping_contact)
    expect(page).to have_content(contract.rental_period.description)
  end
end
