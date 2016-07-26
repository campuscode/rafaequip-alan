require 'rails_helper'

feature 'User create a customer' do
  scenario 'successfully' do
    customer = build(:customer)

    visit new_customer_path

    fill_in 'Código do cliente',      with: customer.code
    fill_in 'Razão Social',           with: customer.name
    fill_in 'CPF/CNPJ',               with: customer.document
    fill_in 'Endereço de cobrança',   with: customer.billing_address
    fill_in 'Cidade',                 with: customer.billing_city
    fill_in 'Estado',                 with: customer.billing_state
    fill_in 'CEP',                    with: customer.billing_zipcode
    fill_in 'Contato Financeiro',     with: customer.financial_contact

    click_on 'Criar Cliente'

    expect(page).to have_content(customer.code)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.document)
    expect(page).to have_content(customer.billing_address)
    expect(page).to have_content(customer.billing_city)
    expect(page).to have_content(customer.billing_state)
    expect(page).to have_content(customer.billing_zipcode)
    expect(page).to have_content(customer.financial_contact)
  end

  scenario 'and should fill all fields' do
    visit new_customer_path

    click_on 'Criar Cliente'

    expect(page).to have_content('Não foi possivel criar o cliente')
  end
end
