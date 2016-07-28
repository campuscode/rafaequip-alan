module LoginMacro
  def login_user
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
  end
end
