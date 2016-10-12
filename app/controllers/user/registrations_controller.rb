#overrided devise registrations controller 
class User::RegistrationsController < Devise::RegistrationsController
def after_inactive_sign_up_path_for(resource)
      p "======after signup==========#{resource.inspect}======"
  	   # flash[:notice] = "You will receive an email with instructions for how to confirm your email address in a few minutes."
       new_user_session_path
 end

#change password when user logged in
 def update
    p "========#{params.inspect}============="
  if current_user.valid_password?(params[:user][:current_password])	
    current_user.update_attributes(password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
    flash[:notice] = "Password changed"
    redirect_to new_user_session_path
   else
 	flash[:notice] = "Invalid current password"
    redirect_to edit_user_registration_path
   end  
  end
end
