require 'rails_helper'

feature 'User create a devolution receipt' do
  scenario 'successfully' do
    equip_list = create_list(:equipment, 3)
    rental_period = create(:rental_period)
    contract = create(:contract,
                      equipment: equip_list,
                      rental_period: rental_period)

    visit contract_path(contract)

    click_on 'Recibo de devolução'

    fill_in 'Funcionário', with: 'Joaquim Roberto'
    fill_in 'CNPJ/CPF', with: '123456789'

    click_on 'Gerar Recibo'

    expect(page).to have_css('h1', text: 'Recibo de Devolução')
    expect(page).to have_content(receipt.employer)
    expect(page).to have_content(receipt.contract.equipment)
    expect(page).to have_content(receipt.contract.contract_number)
    expect(page).to have_content(receipt.contract.customer)
    expect(page).to have_content(receipt.customer_document)
    expect(page).to have_content(receipt.contract.date_end)
    expect(page).to have_content('declaro ter recebido os equipamentos')
    expect(page).to have_content('em devolução referente ao contrato')
    expect(page).to have_content('em perfeitas condições da empresa')
    expect(page).to have_content('Assinatura do Funcionário')
  end
end
