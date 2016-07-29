require 'rails_helper'

feature 'User cannot see rented equipment' do
  scenario 'Cannot appear rented equipment' do
    available_equipment =   create(:equipment)
    unavailable_equipment = create(:equipment, :unavailable)
    maintenance_equipment = create(:equipment, :maintenance)

    visit new_contract_path

    expect(page).to     have_content(available_equipment.description)
    expect(page).not_to have_content(unavailable_equipment.description)
    expect(page).not_to have_content(maintenance_equipment.description)
  end

  scenario 'Should appear released equipment' do
    equipment = create(:equipment)
    contract =  create(:contract, equipment: [equipment])

    visit contract_path(contract)

    expect(page).to have_content(equipment.description)
  end
end
