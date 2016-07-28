feature 'User logout' do
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

    within('nav') do
      click_on 'Sair'
    end

    expect(page).to_not have_content("Olá, #{user.email}")
    expect(page).to have_content('Saiu com sucesso')

    within('nav') do
      expect(page).to_not have_content('Contratos')
      expect(page).to_not have_content('Clientes')
      expect(page).to_not have_content('Equipamentos')
    end
  end
end
