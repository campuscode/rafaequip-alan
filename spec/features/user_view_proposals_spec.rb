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
  scenario 'order by created at' do
    created_at = DateTime.now
    
    proposal1 = create(:proposal, name: 'Proposta 1', created_at: created_at+1)
    proposal2 = create(:proposal, name: 'Proposta 2', created_at: created_at+2)

    visit proposals_path
    puts page.html
    
    expect(page.find("tr:nth-child(2) td:nth-child(5)")).to have_content l(proposal2.created_at)
        #expect(page.find('table:tbody:tr:th-child(1)')).to have_content l(proposal2.created_at)
    
    # within('tr', :text => 'Proposta 2') do |ref|
    #   page.should have_selector('td', :text => l(proposal2.created_at))
    # end

  end
end
