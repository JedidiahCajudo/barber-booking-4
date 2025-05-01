class ApplicationController < ActionController::Base
  # Override the default Devise method for after sign up
  def after_sign_up_path_for(resource)
    # Customize this to direct users to the right dashboard
    if resource.is_a?(Barber)
      barbers_dashboard_path # or whatever path you want for barbers
    else
      clients_dashboard_path # or whatever path you want for clients
    end
  end
end
