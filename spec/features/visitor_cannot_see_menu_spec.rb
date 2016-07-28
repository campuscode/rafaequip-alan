require 'rails_helper'

feature 'visitor cannot see menu' do
  scenario 'visit index without login' do
    visit root_path

    within('nav') do
      expect(page).to_not have_content('Contratos')
      expect(page).to_not have_content('Clientes')
      expect(page).to_not have_content('Equipamentos')
    end
  end

  scenario 'trying access directly contract' do
    visit contracts_path

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end

  scenario 'trying access directly equipment' do
    visit equipment_index_path

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end

  scenario 'trying access directly proposals' do
    visit proposals_path

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end
end
