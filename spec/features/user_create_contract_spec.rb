require 'rails_helper'

feature 'user_create_contract' do
  scenario 'successfully' do
    visit new_contract_path

    fill_in 'Número do contrato', with: '123'
    fill_in 'Número do pedido', with: '123456'
    fill_in 'Cliente', with: 'Campus Code'
    fill_in 'Endereço de entrega', with: 'Alameda Santos, 1293'
    fill_in 'Contato de entrega', with: 'Alan'
    fill_in 'Prazo de locação', with: '3 dias'
    fill_in 'Data de início', with: '18/07/2016'
    fill_in 'Data de término', with: '20/07/2016'
    fill_in 'Valor total', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Emitir contrato'

    expect(page).to have_css('h1', text: '123')
    expect(page).to have_content('123456')
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('Alameda Santos, 1293')
    expect(page).to have_content('Alan')
    expect(page).to have_content('3 dias')
    expect(page).to have_content('18/07/2016')
    expect(page).to have_content('20/07/2016')
    expect(page).to have_content('500')
    expect(page).to have_content('10')
  end

  scenario 'with invalid data' do
    visit new_contract_path

    click_on 'Emitir contrato'
    expect(page).to have_content('Não foi possível emitir contrato')
  end
end
