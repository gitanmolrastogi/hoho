class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
  end

  private
  def after_sign_in_path_for(resource)
      p "------after signin----#{resource.inspect}---------"
       root_path
  end
  def after_sign_out_path_for(resource)
      p "------after signout----#{resource.inspect}---------"
       new_user_session_path
  end
  
 

end

