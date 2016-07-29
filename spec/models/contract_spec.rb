require 'rails_helper'

describe Contract do
  describe '#calc_price' do
    it 'when 1 equipment' do
      equipment = create(:equipment)
      rental_period = create(:rental_period, description: '3 dias')
      create(:price, equipment: equipment,
                     rental_period: rental_period,
                     amount: 150.0)

      contract = create(:contract,
                        equipment: [equipment],
                        rental_period: rental_period)

      expect(contract.price).to eq(150.0)
    end

    it 'when 2 equipment' do
      equipment1 =    create(:equipment)
      equipment2 =    create(:equipment)
      rental_period = create(:rental_period, description: '3 dias')

      create(:price,
             equipment: equipment1,
             rental_period: rental_period,
             amount: 150.0)

      create(:price,
             equipment: equipment2,
             rental_period: rental_period,
             amount: 150.0)

      contract = create(:contract,
                        equipment: [equipment1, equipment2],
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

  describe '#total_value' do
    it 'when contract is create' do
      equipment = create(:equipment)
      rental_period = create(:rental_period, description: '1 dia')
      create(:price, equipment:     equipment,
                     rental_period: rental_period,
                     amount:        100.0)

      contract = create(:contract,
                        equipment:      [equipment],
                        rental_period:  rental_period,
                        discount:       30)

      expect(contract.total_value).to eq(70)
    end
  end

  describe '#equipment_unavailable' do
    it 'Equipment must be unavailable' do
      available_equipment1 = create(:equipment)
      available_equipment2 = create(:equipment)

      contract = create(:contract,
                        equipment: [available_equipment1,
                                    available_equipment2])

      contract.equipment.each do |equip|
        expect(equip.status).to eq('unavailable')
      end
    end
  end

  describe '#equipment_available' do
    it 'Equipment should be available' do
      equip_list = create_list(:equipment, 2)
      contract =   create(:contract, equipment: equip_list)

      contract.equipment.each do |equip|
        expect(equip.status).to eq('unavailable')
      end

      contract.close

      contract.equipment.each do |equip|
        expect(equip.status).to eq('available')
      end
    end
  end
end
