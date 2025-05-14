class BookingsController < ApplicationController
  def new
    # Fetch the barbershop where the booking will be made
    @barbershop = Barbershop.find(params[:barbershop_id])

    # Initialize a new booking and fetch the services for the barbershop
    @booking = Booking.new
    @services = @barbershop.services
    @time_options = time_options  # Provide available time slots for the booking
  end

  def create
    # Find the barbershop where the booking is being made
    @barbershop = Barbershop.find(params[:barbershop_id])

    # Create a new booking associated with the selected barbershop
    @booking = @barbershop.bookings.new(booking_params)

    # Assign the current user as the one making the booking
    @booking.user = current_user

    # Attempt to save the booking
    if @booking.save
      Rails.logger.info "Booking created successfully: #{@booking.inspect}"
      redirect_to @barbershop, notice: "Booking confirmed!"
    else
      Rails.logger.error "Booking creation failed: #{@booking.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  # Provide available time slots (30-minute increments for 24 hours)
  def time_options
    times = []
    current_time = Time.now.beginning_of_hour  # Start from the current hour
    24.times do
      times << current_time.strftime("%H:%M")  # Format time as "HH:MM" (24-hour format)
      current_time += 30.minutes  # Increment time by 30 minutes
    end
    times
  end

  private

  # Strong parameters for booking creation
  def booking_params
    params.require(:booking).permit(:service_id, :start_time)
  end
end
