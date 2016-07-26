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

      expect(contract.price).to eq(150.0)
    end

    it 'when 2 equipment' do
      equip_list = create_list(:equipment, 2)
      rental_period = create(:rental_period, description: '3 dias')

      create(:price,
             equipment: equip_list[0],
             rental_period: rental_period,
             amount: 150.0)
      create(:price,
             equipment: equip_list[1],
             rental_period: rental_period,
             amount: 150.0)

      contract = create(:contract,
                        equipment: equip_list,
                        rental_period: rental_period)

      expect(contract.price).to eq(300.0)
    end
  end

  context 'when have equipment' do
    it 'Contracts with equipment' do
      equip_list = create_list(:equipment, 2)
      rental_period = create(:rental_period, description: '5 dias')
      create(:contract, equipment: equip_list, rental_period: rental_period)

      expect(Contract.last.equipment).to match_array(equip_list)
    end
  end

  describe '#set_initial_status' do
    it 'when contract is create' do
      contract = create(:contract)
      expect(contract.status).to eq('Em aberto')
    end

    it 'when contract already exists with status' do
      contract = create(:contract, status: 'Encerrado')

      expect(contract.status).to eq('Encerrado')
    end
  end
end
