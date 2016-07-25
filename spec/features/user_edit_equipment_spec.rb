require 'rails_helper'

feature 'User edit equipment' do
  scenario 'successfully' do
    equip = create(:equipment)

    visit edit_equipment_path(equip)

    equip_edited = Equipment.create(equipment_code: 'BETONE001',
                                    description:
                                    'Betoneira 400 litros Elétrica',
                                    supplier:      'Betoneira',
                                    category:      'Betoneira Elétrica',
                                    price:         1500.00,
                                    serial_number: '555666',
                                    status:        'Alugado')

    fill_in 'Código do cliente',  with: equip_edited.equipment_code
    fill_in 'Descrição',          with: equip_edited.description
    fill_in 'Fornecedor',         with: equip_edited.supplier
    fill_in 'Categoria',          with: equip_edited.category
    fill_in 'Preço',              with: equip_edited.price
    fill_in 'Número de série',    with: equip_edited.serial_number
    fill_in 'Status',             with: equip_edited.status

    click_on 'Atualizar Equipamento'

    expect(page).to have_content equip_edited.equipment_code
    expect(page).to have_content equip_edited.description
    expect(page).to have_content equip_edited.supplier
    expect(page).to have_content equip_edited.category
    expect(page).to have_content equip_edited.price
    expect(page).to have_content equip_edited.serial_number
    expect(page).to have_content equip_edited.status
  end

  scenario 'with valid data' do
    equip = create(:equipment)

    visit edit_equipment_path(equip)

    fill_in 'Descrição',       with: ''
    fill_in 'Fornecedor',      with: ''
    fill_in 'Categoria',       with: ''
    fill_in 'Preço',           with: ''
    fill_in 'Número de série', with: ''
    fill_in 'Status',          with: ''

    click_on 'Atualizar Equipamento'

    expect(page).to have_content 'Não foi possível atualizar o equipamento!'
  end
end
