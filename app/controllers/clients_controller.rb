class ClientsController < ApplicationController
  def dashboard
    @barbershops = Barbershop.all
  end
end
