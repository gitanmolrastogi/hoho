#overrided devise session controller 
class User::SessionsController < Devise::SessionsController
	def create
		p "=========sessions========#{params[:user][:email].inspect}"
		@email= (params[:user][:email]).downcase
		@user = User.find_by(email:  @email)#.try(:authenticate, params[:user][:password])
	    p "======@user===#{@user.inspect}====" 
       if !(@user && @user.valid_password?(params[:user][:password]))
       	    p "---------invalid------------"
           flash[:danger] = "Invalid email/password"
           redirect_to new_user_session_path
	    elsif @user && @user.confirmed_at == nil
	    	p "-----------confirmation---------"
		  flash[:notice] = "Your email address not confirmed yet."
          redirect_to new_user_session_path
        elsif @user.is_block
        	p "-----------block---------"
		  flash[:notice] = "Your email has been blocked by the administrator."
          redirect_to new_user_session_path
	   else
	   	 super
	   end
	end
end
