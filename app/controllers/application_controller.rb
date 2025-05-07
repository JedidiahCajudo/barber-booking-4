class ApplicationController < ActionController::Base
  # Override the default Devise method for after sign up
  def after_sign_up_path_for(resource)
    # Customize this to direct users to the right dashboard
    if resource.is_a?(Barber)
      barbers_dashboard_path # or whatever path you want for barbers
    else
      barbershops_path # or whatever path you want for clients
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Barber)
      barbers_dashboard_path
    else
      barbershops_path
    end
  end


  # Allow Devise to accept the role parameter during sign-up
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
