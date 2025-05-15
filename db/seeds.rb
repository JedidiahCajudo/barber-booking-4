require 'faker'
require 'unsplash'

# Clear old data
Booking.destroy_all
Barbershop.destroy_all

# Configure Unsplash API client (assuming you have set up the API key in the environment variables)
Unsplash.configure do |config|
  config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
  config.application_secret = ENV['UNSPLASH_SECRET_KEY']
  config.application_redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
  config.utm_source = 'barber-booking-app' # Ensure this is included
end

# Create a user (barber)
user = User.find_or_create_by(email: 'barber@example.com') do |u|
  u.password = 'password'
  u.role = 'barber'
end

# Create some barbershops with basic information
6.times do
  barbershop = Barbershop.create!(
    name: "#{Faker::Company.name} Barbershop",
    address: Faker::Address.street_address,
    city: ["Chiyoda", "Chūō", "Minato", "Shinjuku", "Bunkyō", "Taitō", "Sumida", "Kōtō",
      "Shinagawa", "Meguro", "Ōta", "Setagaya", "Shibuya", "Nakano", "Suginami",
      "Toshima", "Kita", "Arakawa", "Itabashi", "Nerima", "Adachi", "Katsushika", "Edogawa"].sample,
    instagram: "https://instagram.com/#{Faker::Internet.username}",
    user: user
  )

  # Fetch a random image from Unsplash (querying for 'barbershop')
  photo = Unsplash::Photo.random(query: 'barbershop', orientation: 'landscape').first

  # Check if a valid photo was returned, and set a fallback image if not
  if photo
    image_url = photo['urls']['regular']
    # Use the remote URL for Cloudinary (no conversion needed)
    barbershop.remote_photo_url = image_url
  else
    # Fallback image: Use a local file or a Cloudinary hosted image if placeholder fails
    puts "No image found for barbershop: #{barbershop.name}. Using fallback image."

    # Example fallback URL (if you have a default image uploaded to Cloudinary):
    fallback_image_url = 'https://res.cloudinary.com/your-cloud-name/image/upload/v1610000000/default_image.jpg'

    # Simply assign the fallback URL to Cloudinary's remote photo URL
    barbershop.remote_photo_url = fallback_image_url
  end

  # Save the barbershop with or without the image
  barbershop.save!

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
