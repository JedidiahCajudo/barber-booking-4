require 'faker'

# Clear old data
Barbershop.destroy_all

# Create some barbershops with basic information
3.times do
  Barbershop.create!(
    name: "#{Faker::Company.name} Barbershop",
    address: Faker::Address.street_address,
    city: "New York",
    instagram: "https://instagram.com/#{Faker::Internet.username}"
  )
end
