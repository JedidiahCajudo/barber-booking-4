class BookingsController < ApplicationController
  def new
    @barbershop = Barbershop.find(params[:barbershop_id])
    @booking = Booking.new
  end

  def create
  end
end
