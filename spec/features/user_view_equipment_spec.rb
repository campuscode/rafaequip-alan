require 'rails_helper'

feature 'user view equipment' do
  scenario 'successfully' do
    equipment  = create(:equipment)
    equipment1 = create(:equipment, equipment_code: '1234',
                                    available: true)

    login_user
    visit equipment_index_path

    expect(page).to have_content(equipment.equipment_code)
    expect(page).to have_content(equipment.available)
    expect(page).to have_content(equipment1.equipment_code)
    expect(page).to have_content(equipment1.available)
  end

  scenario 'empty list' do
    login_user
    visit equipment_index_path

    expect(page).to have_content('Nenhum equipamento cadastrado')
  end
end
