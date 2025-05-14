require 'faker'
require 'httparty'

# Unsplash API
UNSPLASH_API_URL = "https://api.unsplash.com/photos/random?query=barbershop&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"

# Clear old data
Barbershop.destroy_all

# Create 3 barbershops with random images
3.times do
  # Fetch a random barbershop image from Unsplash
  response = HTTParty.get(UNSPLASH_API_URL)
  image_url = response.parsed_response['urls']['regular']

  Barbershop.create!(
    name: "#{Faker::Hipster.word.capitalize} Cuts",
    address: Faker::Address.street_address,
    city: "New York",
    instagram: "https://instagram.com/#{Faker::Internet.username}",
    remote_photo_url: image_url  # Adding a real barbershop image from Unsplash
  )
end
