require 'carrierwave/orm/activerecord'
require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/cloudinary'
  config.fog_credentials = {
    provider: 'Cloudinary',
    cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
    api_key: ENV['CLOUDINARY_API_KEY'],
    api_secret: ENV['CLOUDINARY_API_SECRET']
  }
  config.fog_directory = ENV['CLOUDINARY_CLOUD_NAME']
end
