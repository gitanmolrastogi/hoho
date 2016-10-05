class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?

before_filter :set_cache_headers
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


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

