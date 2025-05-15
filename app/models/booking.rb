class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :barbershop
  belongs_to :service

  validates :service_id, presence: true
  validates :start_time, presence: true
  validate :check_time_availability

  private

  def check_time_availability
    if Booking.exists?(barbershop_id: barbershop_id, start_time: start_time)
      errors.add(:start_time, "is already taken for this barbershop")
    end
  end
end
