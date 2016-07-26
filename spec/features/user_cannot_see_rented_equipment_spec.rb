require 'rails_helper'

feature 'User cannot see rented equipment' do
  scenario 'Cannot appear rented equipment' do
    equipment1 = create(:equipment, available: false)
    equipment2 = create(:equipment, description: 'Furadeira')
    create(:contract, equipment: [equipment1])

    visit new_contract_path

    expect(page).not_to have_content(equipment1.description)
    expect(page).to have_content(equipment2.description)
  end
  scenario 'Should appear released equipment' do
    equipment = create(:equipment)
    contract = create(:contract, equipment: [equipment])

    visit contract_path(contract)

    click_on 'Encerrar contrato'

    visit new_contract_path

    expect(page).to have_content(equipment.description)
  end
end
