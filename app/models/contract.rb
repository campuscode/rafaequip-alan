class Contract < ApplicationRecord
  validates :contract_number, :customer, :shipping_address, :rental_period_id,
            :shipping_contact, :date_begin, :date_end,
            :discount, presence: true

  before_validation :calc_date_end

  before_save do
    calc_price
    set_initial_status
  end

  belongs_to :rental_period
  has_many   :rented_equipment
  has_many   :equipment, through: :rented_equipment
  has_one    :devolution_receipt
  has_one    :delivery_receipt

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
end
