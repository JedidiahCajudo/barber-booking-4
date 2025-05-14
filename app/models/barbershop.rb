
class Barbershop < ApplicationRecord
  belongs_to :user
  has_many :services, dependent: :destroy
  has_many :services, dependent: :destroy
  mount_uploader :photo, PhotoUploader

end
