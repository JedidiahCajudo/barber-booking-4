class BookingsController < ApplicationController
  def new
    @barbershop = Barbershop.find(params[:barbershop_id])
    @booking = Booking.new
    @services = @barbershop.services
    @time_options = time_options
  end

  def create
      Rails.logger.info "BookingsController#create hit"
    @barbershop = Barbershop.find(params[:barbershop_id])

    date = booking_params[:date]  # "YYYY-MM-DD" string
    time = booking_params[:start_time]  # "HH:MM" string

    if date.present? && time.present?
      start_time = DateTime.parse("#{date} #{time}")
    else
      start_time = nil
    end

    @booking = @barbershop.bookings.new(service_id: booking_params[:service_id], start_time: start_time)
    @booking.user = current_user

    if @booking.save
      Rails.logger.info "Booking created successfully: #{@booking.inspect}"
      redirect_to booking_path(@booking), notice: "Booking confirmed!"
    else
      Rails.logger.error "Booking creation failed: #{@booking.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def time_options
    times = []
    current_time = Time.now.beginning_of_hour
    24.times do
      times << current_time.strftime("%H:%M")
      current_time += 30.minutes
    end
    times
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:service_id, :start_time, :date)
  end
end
