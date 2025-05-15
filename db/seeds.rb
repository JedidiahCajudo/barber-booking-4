require 'faker'

# Clear old data
Booking.destroy_all
Barbershop.destroy_all

# Create a user (barber)
user = User.find_or_create_by(email: 'barber@example.com') do |u|
  u.password = 'password'
  u.role = 'barber'
end

# Create some barbershops with basic information
10.times do
  barbershop = Barbershop.create!(
    name: "#{Faker::Company.name} Barbershop",
    address: Faker::Address.street_address,
    city: ["Chiyoda", "Chūō", "Minato", "Shinjuku", "Bunkyō", "Taitō", "Sumida", "Kōtō",
           "Shinagawa", "Meguro", "Ōta", "Setagaya", "Shibuya", "Nakano", "Suginami",
           "Toshima", "Kita", "Arakawa", "Itabashi", "Nerima", "Adachi", "Katsushika", "Edogawa"].sample,
    instagram: "https://instagram.com/#{Faker::Internet.username}",
    user: user
  )

  # Add some services to the barbershop
  services = [
    { name: "Cut", price: 3000 },
    { name: "Color", price: 5000 },
    { name: "Perm", price: 6000 },
    { name: "Shave", price: 2000 },
    { name: "Eyebrows & Eyelashes", price: 3500 }
  ]

  # Pick 2 to 4 random services per barbershop
  services.sample(rand(2..4)).each do |service|
    barbershop.services.create!(service)
  end
end
