period1 = RentalPeriod.create(description: '1 dia')
period2 = RentalPeriod.create(description: '3 dias')
period3 = RentalPeriod.create(description: '5 dias')
period4 = RentalPeriod.create(description: '7 dias')
period5 = RentalPeriod.create(description: '15 dias')
period6 = RentalPeriod.create(description: '21 dias')
period7 = RentalPeriod.create(description: '30 dias')

equipment1 = Equipment.create(equipment_code: 2031,
                              description: 'Furadeira',
                              supplier: 'Bosch',
                              category: 'Furadeiras',
                              price: 500.0,
                              serial_number: '987654132')

equipment2 = Equipment.create(equipment_code: 2032,
                              description: 'Betoneira',
                              supplier: 'Lee Tool',
                              category: 'Betoneiras',
                              price: 943.0,
                              serial_number: '12312900973')

Price.create(amount: 79.0, equipment: equipment1, rental_period: period1)
Price.create(amount: 179.0, equipment: equipment1, rental_period: period2)
Price.create(amount: 279.0, equipment: equipment1, rental_period: period3)
Price.create(amount: 379.0, equipment: equipment1, rental_period: period4)
Price.create(amount: 479.0, equipment: equipment1, rental_period: period5)
Price.create(amount: 579.0, equipment: equipment1, rental_period: period6)
Price.create(amount: 679.0, equipment: equipment1, rental_period: period7)

Price.create(amount: 102.0, equipment: equipment2, rental_period: period1)
Price.create(amount: 502.0, equipment: equipment2, rental_period: period2)
Price.create(amount: 600.0, equipment: equipment2, rental_period: period3)
Price.create(amount: 1102.0, equipment: equipment2, rental_period: period4)
Price.create(amount: 1302.0, equipment: equipment2, rental_period: period5)
Price.create(amount: 1600.0, equipment: equipment2, rental_period: period6)
Price.create(amount: 1800.0, equipment: equipment2, rental_period: period7)
