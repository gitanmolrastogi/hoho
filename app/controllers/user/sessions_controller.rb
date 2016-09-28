
#overrided devise session controller 
class User::SessionsController < Devise::SessionsController
	def create
		p "=========sessions========#{params[:user][:email].inspect}"
		@email= (params[:user][:email]).downcase
		@user = User.find_by(email:  @email)#.try(:authenticate, params[:user][:password])
	    p "======@user===#{@user.inspect}====" 
       if !(@user && @user.valid_password?(params[:user][:password]))
       	    p "---------invalid------------"
           flash[:notice] = "Invalid email/password"
           redirect_to new_user_session_path
	    elsif @user && @user.confirmed_at == nil
	    	p "-----------confirmation---------"
		  flash[:notice] = "Account not activated yet."
          redirect_to new_user_session_path
	   else
	   	 super
	   end
	end
end
