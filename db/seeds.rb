require 'faker'

# Clear old data
Barbershop.destroy_all
User.destroy_all

# Create 3 barbers (users with the role "barber")
3.times do
  barber = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'barber' # Ensure this user is a barber
  )

  # Each barber owns 1-2 barbershops
  rand(1..2).times do
    Barbershop.create!(
      name: "#{Faker::Hipster.word.capitalize} Cuts",
      address: Faker::Address.street_address,
      city: "New York",
      instagram: "https://instagram.com/#{Faker::Internet.username}",
      user: barber # Linking barbershop to this barber user
    )
  end
end

# Create some clients as well (users with the role "client")
5.times do
  client = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'client' # Ensure this user is a client
  )
end
