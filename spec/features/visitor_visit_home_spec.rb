require 'rails_helper'

feature 'Visitor visit home' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_css('h1', text:'RafaEquip')
  end
end
