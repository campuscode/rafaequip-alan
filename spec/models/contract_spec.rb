require 'rails_helper'

describe Contract do
  describe '#calc_price' do
    it 'when 1 equipment' do
      equipment = create(:equipment)
      rental_period = create(:rental_period, description: '3 dias')
      create(:price, equipment: equipment, rental_period: rental_period,
                     amount: 150.0)

      contract = create(:contract,
                        equipment: [equipment],
                        rental_period: rental_period)
      contract.calc_price
      expect(contract.price).to eq(150.0)
    end

    it 'when 2 equipment' do
      equipment = create(:equipment)
      equipment2 = create(:equipment)
      rental_period = create(:rental_period, description: '3 dias')
      create(:price,
             equipment: equipment,
             rental_period: rental_period,
             amount: 150.0)
      create(:price,
             equipment: equipment2,
             rental_period: rental_period,
             amount: 150.0)

      contract = create(:contract,
                        equipment: [equipment, equipment2],
                        rental_period: rental_period)
      contract.calc_price
      expect(contract.price).to eq(300.0)
    end
  end
end
