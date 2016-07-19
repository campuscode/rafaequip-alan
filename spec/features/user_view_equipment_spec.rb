require 'rails_helper'

feature 'user view equipment' do
  scenario 'successfully' do
    equipment  = create(:equipment)
    equipment1 = create(:equipment, customer_code: '1234', status: 'Disponível')

    visit equipment_index_path

    expect(page).to have_content(equipment.customer_code)
    expect(page).to have_content(equipment.status)
    expect(page).to have_content(equipment1.customer_code)
    expect(page).to have_content(equipment1.status)
  end

  scenario 'empty list' do
    visit equipment_index_path

    expect(page).to have_content('Nenhum equipamento cadastrado')
  end
end
