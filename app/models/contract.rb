class Contract < ApplicationRecord
  validates :contract_number, :customer_id, :shipping_address,
            :rental_period_id, :shipping_contact, :date_begin, :date_end,
            :discount, presence: true

  before_validation :calc_date_end
  before_save :calc_price, :set_initial_status
  after_create :set_equipment_unavailable

  belongs_to :customer
  belongs_to :rental_period
  has_many   :rented_equipment
  has_many   :equipment, through: :rented_equipment
  has_one    :devolution_receipt
  has_one    :delivery_receipt

  def total_value
    price - discount if price
  end

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

  def calc_date_end
    self.date_end = date_begin + rental_period.period if rental_period
  end

  def set_initial_status
    self.status ||= 'Em aberto'
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
