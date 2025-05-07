class BarbershopsController < ApplicationController
  # Only allow clients to see the barbershops
  before_action :authenticate_user!, only: [:index, :show]  # Ensure the user is logged in

  def index
    logger.debug "Current user: #{current_user.inspect}"  # Check who the current user is
    @barbershops = Barbershop.all
  end

  def show
    @barbershop = Barbershop.find(params[:id])
  end
end
