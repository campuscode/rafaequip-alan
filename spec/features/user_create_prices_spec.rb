require 'rails_helper'

feature 'User create prices' do
  scenario 'successfully' do
    price = build(:price)

    login_user
    visit new_price_path

    select price.rental_period.description, from: 'Período'
    select price.equipment.description, from: 'Equipamento'
    fill_in 'Preço', with: '1.5'

    click_on 'Criar preço'

    expect(page).to have_content price.rental_period.description
    expect(page).to have_content price.equipment.description
    expect(page).to have_content 'R$ 1,50'
  end

  scenario 'with invalid data' do
    login_user
    visit new_price_path

    click_on 'Criar preço'

    expect(page).to have_content 'Não foi possível criar um novo preço.'
  end

  scenario 'Cannot overwrite the previous price' do
    create(:price)

    login_user
    visit new_price_path

    price2 = build(:price)
    select price2.rental_period.description, from: 'Período'
    select price2.equipment.description, from: 'Equipamento'
    fill_in 'Preço', with: '2.0'

    click_on 'Criar preço'

    expect(page).not_to have_content 'R$ 1,50'
    expect(page).to have_content price2.rental_period.description
    expect(page).to have_content price2.equipment.description
    expect(page).to have_content 'R$ 2,00'
  end
end
