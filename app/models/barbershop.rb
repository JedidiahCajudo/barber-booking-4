
class Barbershop < ApplicationRecord
  belongs_to :user
  has_many :services
  has_many :bookings
  mount_uploader :photo, PhotoUploader

end
