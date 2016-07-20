require 'rails_helper'

RSpec.describe Contract do
  it 'Contracts with equipment' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment)
    create(:contract, equipment: [equipment1, equipment2])

    expect(Contract.last.equipment).to match_array([equipment1, equipment2])
  end
end
