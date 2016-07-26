require 'rails_helper'

feature 'User create equipment' do
  scenario 'sucessfulley' do
    equip = build(:equipment)

    visit new_equipment_path

    fill_in 'Código do cliente',  with: equip.equipment_code
    fill_in 'Descrição',          with: equip.description
    fill_in 'Categoria',          with: equip.category
    fill_in 'Fornecedor',         with: equip.supplier
    fill_in 'Preço',              with: equip.price
    fill_in 'Número de série',    with: equip.serial_number
    fill_in 'Status',             with: equip.status

    click_on 'Criar Equipamento'

    expect(page).to have_content equip.equipment_code
    expect(page).to have_content equip.description
    expect(page).to have_content equip.supplier
    expect(page).to have_content equip.category
    expect(page).to have_content number_to_currency(equip.price)
    expect(page).to have_content equip.serial_number
    expect(page).to have_content equip.status
  end

  scenario 'invalid' do
    visit new_equipment_path

    click_on 'Criar Equipamento'

    expect(page).to have_content 'Não foi possível criar o equipamento!'
  end
end
