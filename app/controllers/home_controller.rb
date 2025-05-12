class HomeController < ApplicationController
  def index
    @barbershops = Barbershop.all 
  end
end
