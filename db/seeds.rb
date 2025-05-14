require 'faker'
require 'httparty'

# Unsplash API
UNSPLASH_API_URL = "https://api.unsplash.com/photos/random?query=barbershop&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"

# Clear old data
Barbershop.destroy_all

# Create 3 barbers (users with the role "barber")
3.times do
  barber = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'barber'
  )

  # Fetch a random barbershop image from Unsplash
  response = HTTParty.get(UNSPLASH_API_URL)
  puts response.parsed_response.class
  puts response.parsed_response
  image_url = response.parsed_response['urls']['regular']


  # Each barber owns 1-2 barbershops
  rand(1..2).times do
    Barbershop.create!(
      name: "#{Faker::Hipster.word.capitalize} Cuts",
      address: Faker::Address.street_address,
      city: "New York",
      instagram: "https://instagram.com/#{Faker::Internet.username}",
      user: barber,
      remote_photo_url: image_url  # Adding a real barbershop image from Unsplash
    )
  end
end

# Create some clients as well (users with the role "client")
5.times do
  client = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'client'
  )
end
