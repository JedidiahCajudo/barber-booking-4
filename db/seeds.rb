require 'faker'

# Clear old data
Barbershop.destroy_all

# Create a user (barber)
user = User.create!(
  email: 'barber@example.com',
  password: 'password',
  role: 'barber'
)

# Create some barbershops with basic information
3.times do
  barbershop = Barbershop.create!(
    name: "#{Faker::Company.name} Barbershop",
    address: Faker::Address.street_address,
    city: "New York",
    instagram: "https://instagram.com/#{Faker::Internet.username}",
    user: user
  )

  # Add some services to the barbershop
  barbershop.services.create!(name: "Haircut", price: 20)
  barbershop.services.create!(name: "Shave", price: 15)
  barbershop.services.create!(name: "Beard Trim", price: 10)
end
