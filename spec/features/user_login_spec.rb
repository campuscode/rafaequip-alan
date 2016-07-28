require 'rails_helper'

feature 'User login' do
  scenario 'successfully' do
    user = create(:user, email: 'rafael@campuscode.com.br', password: '123456')
    visit root_path

    within('nav') do
      click_on 'Entrar'
    end

    within('section') do
      fill_in 'Email',  with: user.email
      fill_in 'Senha',  with: user.password

      click_on 'Entrar'
    end

    expect(page).to have_content("Olá, #{user.email}")
  end

  scenario 'but user does not exist' do
    visit root_path

    within('nav') do
      click_on 'Entrar'
    end

    within('section') do
      fill_in 'Email',  with: 'Stevie Wonder'
      fill_in 'Senha',  with: '123456'

      click_on 'Entrar'
    end

    expect(page).to have_content('E-mail ou senha inválidos')
  end
end
