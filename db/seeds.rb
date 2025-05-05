require 'faker'

# Clear old data
Barbershop.destroy_all
Barber.destroy_all

# Create 3 barbers
3.times do
  barber = Barber.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password'
  )

  # Each barber owns 1-2 barbershops
  rand(1..2).times do
    Barbershop.create!(
      name: "#{Faker::Hipster.word.capitalize} Cuts",
      address: Faker::Address.street_address,
      city: "Tokyo",
      instagram: "https://instagram.com/#{Faker::Internet.username}",
      user: barber
    )
  end
end
