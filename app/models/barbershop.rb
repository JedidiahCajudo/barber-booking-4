
class Barbershop < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :services, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def available_time_slots(date)
  # Define all slots from 10:00 to 19:00 in 30-minute increments
  slots = (10..18).flat_map do |hour|
    ["#{hour}:00", "#{hour}:30"]
  end + ["19:00"]

  # Convert slots to DateTime objects on the given date
  slots = slots.map { |t| DateTime.parse("#{date} #{t}") }

  # Get booked start_times for this barbershop on the date
  booked = bookings.where(start_time: date.beginning_of_day..date.end_of_day).pluck(:start_time)

  # Return slots that are not booked
  slots.reject { |slot| booked.include?(slot) }
end


end
