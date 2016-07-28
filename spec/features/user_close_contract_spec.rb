require 'rails_helper'

feature 'User close a contract' do
  scenario 'successfully' do
    contract = create(:contract)

    login_user
    visit contract_path(contract)

    click_on 'Encerrar contrato'

    expect(page).to have_content 'Encerrado'
  end
end
