require 'faker'
require 'httparty'

# Unsplash API
UNSPLASH_API_URL = "https://api.unsplash.com/photos/random?query=barbershop&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"

# Clear old data
Barbershop.destroy_all

# Create a default barber user
barber = User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.unique.email,
  password: 'password',
  role: 'barber'
)

# Fetch a random barbershop image from Unsplash
response = HTTParty.get(UNSPLASH_API_URL)
image_url = response.parsed_response['urls']['regular']

# Create barbershops for the default barber user
3.times do
  Barbershop.create!(
    name: "#{Faker::Hipster.word.capitalize} Cuts",
    address: Faker::Address.street_address,
    city: "New York",
    instagram: "https://instagram.com/#{Faker::Internet.username}",
    user: barber,  # Associate with the default barber user
    remote_photo_url: image_url  # Adding a real barbershop image from Unsplash
  )
end
