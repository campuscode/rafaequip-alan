class Contract < ApplicationRecord
  validates :contract_number, :customer, :shipping_address, :rental_period_id,
            :shipping_contact, :date_begin, :date_end,
            :discount, presence: true

  before_save :calc_price
  after_create :set_equipment_unavailable

  belongs_to :rental_period
  has_many   :rented_equipment
  has_many   :equipment, through: :rented_equipment
  has_one    :devolution_receipt
  has_one    :delivery_receipt

  def close
    update(status: 'Encerrado')
    set_equipment_available
  end

  private

  def calc_price
    total = 0
    equipment.each do |equip|
      price = Price.find_by(equipment: equip, rental_period: rental_period)
      total += price.try(:amount).to_f
    end
    self.price = total
  end

  def set_equipment_unavailable
    equipment.each do |equip|
      equip.update(available: false)
    end
  end

  def set_equipment_available
    equipment.each do |equip|
      equip.update(available: true)
    end
  end
end
