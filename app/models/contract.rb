class Contract < ApplicationRecord
  validates :contract_number, :customer, :shipping_address, :rental_period_id,
            :shipping_contact, :date_begin, :date_end,
            :price, :discount, presence: true

  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment

  def calc_price
    binding.pry
    total = 0
    equipment.each do |equip|
      price = Price.find_by(equipment: equip, rental_period: rental_period)
      total += price.try(:amount).to_f
    end
    self.price = total
  end
end
