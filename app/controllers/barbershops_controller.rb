class BarbershopsController < ApplicationController
  # Only allow clients to see the barbershops
  before_action :authenticate_user!, only: [:index, :show]  # Ensure the user is logged in

  def index
    @barbershops = Barbershop.all
  end

  def show
    @barbershop = Barbershop.find(params[:id])
  end
end
