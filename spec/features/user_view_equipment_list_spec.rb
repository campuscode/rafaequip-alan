require 'rails_helper'

feature 'User view equipment list' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, equipment_code: 'FRTMKT002',
                                    serial_number: '654321')

    login_user
    visit root_path
    click_on 'Visualizar Equipamentos'

    expect(page).to have_content equipment1.equipment_code
    expect(page).to have_content equipment1.description
    expect(page).to have_content equipment1.supplier
    expect(page).to have_content equipment1.category
    expect(page).to have_content number_to_currency(equipment1.price)
    expect(page).to have_content equipment1.serial_number
    expect(page).to have_content equipment1.available
    expect(page).to have_content equipment2.equipment_code
    expect(page).to have_content equipment2.description
    expect(page).to have_content equipment2.supplier
    expect(page).to have_content equipment2.category
    expect(page).to have_content number_to_currency(equipment2.price)
    expect(page).to have_content equipment2.serial_number
    expect(page).to have_content equipment2.available
  end
end
