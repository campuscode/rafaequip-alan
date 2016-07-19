require 'rails_helper'

feature 'user view proposals' do
  scenario 'successfully' do
    proposal1 = create(:proposal)
    proposal2 = create(:proposal, name: 'Alan', mail: 'cc@cc.com')

    visit proposals_path

    expect(page).to have_content(proposal1.name)
    expect(page).to have_content(proposal1.mail)
    expect(page).to have_content(proposal1.phone)
    expect(page).to have_content(proposal1.description)
    expect(page).to have_content(proposal2.name)
    expect(page).to have_content(proposal2.mail)
    expect(page).to have_content(proposal2.phone)
    expect(page).to have_content(proposal2.description)
  end
end
