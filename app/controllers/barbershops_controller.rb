class BarbershopsController < ApplicationController
  # Only allow clients to see the barbershops
  before_action :authenticate_user!, only: [:index, :show]  # Ensure the user is logged in

  def index
    @barbershops = Barbershop.all

    # Filter by service if present
    @barbershops = @barbershops.joins(:services).where(services: { name: params[:service] }) if params[:service].present?

    # Filter by location if present
    @barbershops = @barbershops.where(location: params[:location]) if params[:location].present?

    # Handle the date and time for availability
    if params[:date].present? && params[:time].present?
      # Combine date and time into a single datetime value
      start_time = "#{params[:date]} #{params[:time]}"

      # Convert to a DateTime object
      start_time = DateTime.parse(start_time)

      # Filter barbershops based on availability (checking against bookings)
      @barbershops = @barbershops
        .left_joins(:bookings)
        .where("bookings.start_time IS NULL OR bookings.start_time != ?", start_time)
    end
  end

  def show
    @barbershop = Barbershop.find(params[:id])
    @services = @barbershop.services
    @time_options = @barbershop.available_time_slots(Date.today)
  end


end
