class BarbershopsController < ApplicationController
  # Only allow clients to see the barbershops
  before_action :authenticate_user!, only: [:index, :show]  # Ensure the user is logged in

  def index
    @barbershops = Barbershop.all
    @barbershops = Barbershop.all
    @barbershops = @barbershops.where(service: params[:service])       if params[:service].present?
    @barbershops = @barbershops.where(location: params[:location])     if params[:location].present?
    @barbershops = @barbershops.where(date: params[:date])             if params[:date].present?
    @barbershops = @barbershops.where(start_time: params[:time])       if params[:time].present?
  end

  def show
    @barbershop = Barbershop.find(params[:id])
  end
end
