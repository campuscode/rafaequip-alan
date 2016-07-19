require 'rails_helper'

feature 'Visitor visit home and' do
  scenario 'create a proposal' do
    visit root_path

    click_on 'Orçamento'

    proposal = build(:proposal)

    fill_in 'Nome',      with: proposal.name
    fill_in 'Email',     with: proposal.mail
    fill_in 'Telefone',  with: proposal.phone
    fill_in 'Descrição', with: proposal.description

    click_on 'Solicitar Orçamento'

    expect(page).to have_content('Solicitação enviada com sucesso!')
  end

  scenario 'and should fill all fields' do
      visit root_path

      click_on 'Orçamento'

      click_on 'Solicitar Orçamento'

      expect(page).to have_content('Não foi possivel fazer a solicitação')
  end
end
