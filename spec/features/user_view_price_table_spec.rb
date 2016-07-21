require 'rails_helper'

feature 'User view price table' do
  scenario 'successfully' do
    visit root_path

    price = create(:price)

    click_on 'Tabela de Preços'

    expect(page).to have_css('h1', text: 'Tabela de Preços')
    expect(page).to have_content('Equipamento')
    expect(page).to have_content('Prazo')
    expect(page).to have_content('Preço')
    expect(page).to have_content(price.equipment.description)
    expect(page).to have_content(price.rental_period.description)
    expect(page).to have_content(price.amount)
  end
end
