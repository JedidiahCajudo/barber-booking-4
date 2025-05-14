require 'faker'
require 'httparty'
require 'cloudinary'
require 'cloudinary/uploader'
require 'open-uri'

# Unsplash API to fetch random barbershop images
UNSPLASH_API_URL = "https://api.unsplash.com/photos/random?query=barbershop&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"

# Clear old data
Barbershop.destroy_all
User.destroy_all

# Create a default barber user
barber = User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.unique.email,
  password: 'password',
  role: 'barber'
)

# Fetch a random barbershop image from Unsplash
response = HTTParty.get(UNSPLASH_API_URL)

# Debugging to check the structure of the response
puts response.parsed_response.class
puts response.parsed_response

# Extract the image URL (regular size)
image_url = response.parsed_response.first['urls']['regular'] if response.parsed_response.is_a?(Array)

# Check if image_url is valid
if image_url.nil? || image_url.empty?
  raise "Image URL not found in Unsplash response"
end

# Open the image URL and upload it to Cloudinary
image_file = URI.open(image_url)

# Upload image to Cloudinary
cloudinary_image = Cloudinary::Uploader.upload(image_file)

# Create barbershops for the default barber user
3.times do
  Barbershop.create!(
    name: "#{Faker::Hipster.word.capitalize} Cuts",
    address: Faker::Address.street_address,
    city: "New York",
    instagram: "https://instagram.com/#{Faker::Internet.username}",
    user: barber,  # Associate with the default barber user
    photo: cloudinary_image['secure_url']  # Use Cloudinary URL
  )
end
