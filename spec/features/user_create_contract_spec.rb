require 'rails_helper'

feature 'user_create_contract' do
  scenario 'successfully' do
    customer    = create(:customer, name: 'Campus Code')
    equipment   = create(:equipment)
    equipment1  = create(:equipment, description: 'Furadeira')
    period      = create(:rental_period, description: '3 dias', period: 3)

    login_user
    visit new_contract_path

    fill_in 'Número do contrato', with: '123'
    fill_in 'Número do pedido', with: '123456'
    select customer.name, from: 'Cliente'
    fill_in 'Endereço de entrega', with: 'Alameda Santos, 1293'
    fill_in 'Contato de entrega', with: 'Alan'
    select equipment.description, from: 'Equipment'
    select equipment1.description, from: 'Equipment'
    select  period.description, from: 'Prazo de locação'
    fill_in 'Data de início', with: '18/07/2016'
    fill_in 'Desconto', with: '10'

    click_on 'Emitir contrato'

    expect(page).to have_css('h1', text: '123')
    expect(page).to have_content('123456')
    expect(page).to have_content(customer.name)
    expect(page).to have_content('Alameda Santos, 1293')
    expect(page).to have_content('Alan')
    expect(page).to have_content(equipment.description)
    expect(page).to have_content(equipment1.description)
    expect(page).to have_content('3 dias')
    expect(page).to have_content('18/07/2016')
    expect(page).to have_content('21/07/2016')
    expect(page).to have_content('10')
    expect(page).to have_content('Valor a ser pago')
  end

  scenario 'with invalid data' do
    login_user
    visit new_contract_path

    click_on 'Emitir contrato'
    expect(page).to have_content('Não foi possível emitir contrato')
  end
end
