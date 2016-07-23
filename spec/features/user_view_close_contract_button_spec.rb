require 'rails_helper'

feature 'User view close contract button' do
  scenario 'successfully' do
    create(:contract)
    visit contracts_path
    click_on 'Detalhes'

    expect(page).to have_content 'Encerrar contrato'
  end
end
