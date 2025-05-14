class BookingsController < ApplicationController
  def new
    @barbershop = Barbershop.find(params[:barbershop_id])
    @booking = Booking.new
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

  private

  def booking_params
    params.require(:booking).permit(:service_id, :start_time)
  end

end
