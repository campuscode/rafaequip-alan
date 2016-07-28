require 'rails_helper'

feature 'User edit customer' do
  scenario 'successfully' do
    customer = create(:customer, name: 'Camus Code')

    login_user
    visit edit_customer_path(customer)

    customer_edit = build(:customer,
                          name: 'Campus Code',
                          document: '12345',
                          financial_contact: 'Umano Silva',
                          billing_address: 'Rua dois, 123')

    fill_in 'Código do cliente',      with: customer_edit.code
    fill_in 'Razão Social',           with: customer_edit.name
    fill_in 'CPF/CNPJ',               with: customer_edit.document
    fill_in 'Endereço de cobrança',   with: customer_edit.billing_address
    fill_in 'Cidade',                 with: customer_edit.billing_city
    fill_in 'Estado',                 with: customer_edit.billing_state
    fill_in 'CEP',                    with: customer_edit.billing_zipcode
    fill_in 'Contato Financeiro',     with: customer_edit.financial_contact

    click_on 'Atualizar'

    expect(page).to have_content(customer_edit.code)
    expect(page).to have_content(customer_edit.name)
    expect(page).to have_content(customer_edit.document)
    expect(page).to have_content(customer_edit.billing_address)
    expect(page).to have_content(customer_edit.billing_city)
    expect(page).to have_content(customer_edit.billing_state)
    expect(page).to have_content(customer_edit.billing_zipcode)
    expect(page).to have_content(customer_edit.financial_contact)
  end

  scenario 'with invalid data' do
    customer = create(:customer, name: 'Campus Code')

    login_user
    visit edit_customer_path(customer)

    fill_in 'Código do cliente',      with: ''
    fill_in 'Razão Social',           with: ''
    fill_in 'CPF/CNPJ',               with: ''
    fill_in 'Endereço de cobrança',   with: ''
    fill_in 'Cidade',                 with: ''
    fill_in 'Estado',                 with: ''
    fill_in 'CEP',                    with: ''
    fill_in 'Contato Financeiro',     with: ''

    click_on 'Atualizar'
    expect(page).to have_content('Não foi possível atualizar esse cliente')
  end
end
