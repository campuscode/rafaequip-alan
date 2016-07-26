# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RentalPeriod.create(description: '1 dia')
RentalPeriod.create(description: '3 dia')
RentalPeriod.create(description: '5 dia')
RentalPeriod.create(description: '7 dia')
RentalPeriod.create(description: '15 dia')
RentalPeriod.create(description: '30 dia')

Proposal.create(name: 'João Almeida',
                mail: 'contato@campuscode.com.br',
                phone: '11 2020-4321',
                description: 'Quero 2 furadeiras e 1 parafusadeira')

Proposal.create(name: 'Alan',
                mail: 'alan@campuscode.com.br',
                phone: '11 2020-4321',
                description: 'Quero 1 furadeiras e 1 parafusadeira')

Equipment.create(equipment_code: 'FRTBOS001', 
                description: 'Furadeira', 
                supplier: 'Bosch', 
                category: 'Furadeira', 
                price: 325.00,
                serial_number: '000002',
                status: 'Disponivel')

Equipment.create(equipment_code: 'BTN002031',
                description: 'Betoneira',
                supplier: 'DeWalt', 
                category: 'Betoneiras',
                price: 180.00,
                serial_number: '361512638812312',
                status: 'Disponivel')

Equipment.create(equipment_code: 'BTN002032',
                description: 'Parafusadeira',
                category: 'Parafusadeiras',
                price: 300.00,
                serial_number: '34523464565',
                status: 'Disponivel')

periodo1 = RentalPeriod.find(1)
periodo2 = RentalPeriod.find(2)
periodo3 = RentalPeriod.find(3)

equipment1 = Equipment.find(1)
equipment2 = Equipment.find(2)
equipment3 = Equipment.find(3)

Price.create(amount: 1.5, rental_period: periodo1, equipment: equipment1)
Price.create(amount: 5.5, rental_period: periodo2, equipment: equipment2)
Price.create(amount: 9.5, rental_period: periodo3, equipment: equipment3)
