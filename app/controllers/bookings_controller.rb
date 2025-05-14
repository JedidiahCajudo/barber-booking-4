class BookingsController < ApplicationController
  def new
    @barbershop = Barbershop.find(params[:barbershop_id])
    @booking = Booking.new
    @services = @barbershop.services
    @time_options = time_options
  end

  def create
    @barbershop = Barbershop.find(params[:barbershop_id])
    @booking = @barbershop.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @barbershop, notice: "Booking confirmed!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # The time_options method should be placed above private methods
  def time_options
    times = []
    current_time = Time.now.beginning_of_hour  # Start from the current hour, rounding up if necessary
    24.times do
      times << current_time.strftime("%H:%M")  # Add time as "HH:MM" format (24-hour format)
      current_time += 30.minutes  # Increment by 30 minutes
    end
    times
  end

  private

  def booking_params
    params.require(:booking).permit(:service_id, :start_time)
  end
end
