class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :barbershop
  belongs_to :service
end
