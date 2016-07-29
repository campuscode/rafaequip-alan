require 'rails_helper'

feature 'user view equipment' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, equipment_code: '1234')

    visit equipment_index_path

    expect(page).to have_content(equipment1.equipment_code)
    expect(page).to have_content(equipment1.status)
    expect(page).to have_content(equipment2.equipment_code)
    expect(page).to have_content(equipment2.status)
  end

  scenario 'empty list' do
    visit equipment_index_path

    expect(page).to have_content('Nenhum equipamento cadastrado')
  end
end
