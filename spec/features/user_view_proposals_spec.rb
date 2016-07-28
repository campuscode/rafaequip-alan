require 'rails_helper'

feature 'user view proposals' do
  scenario 'successfully' do
    proposal1 = create(:proposal)
    proposal2 = create(:proposal, name: 'Alan', mail: 'cc@cc.com')

    login_user
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

  scenario 'order by created at' do
    created_at = DateTime.current

    proposal1 = create(:proposal,
                       name: 'Proposta 1',
                       created_at: created_at + 1)

    proposal2 = create(:proposal,
                       name: 'Proposta 2',
                       created_at: created_at + 2)

    proposal3 = create(:proposal,
                       name: 'Proposta 3',
                       created_at: created_at + 3)

    visit proposals_path

    within('tbody tr:nth-child(1)') do
      expect(page).to have_content proposal3.name
    end

    within('tbody tr:nth-child(2)') do
      expect(page).to have_content proposal2.name
    end

    expect(page.find('tbody tr:nth-child(3)')).to have_content proposal1.name
  end
end
