class User::UsersController < ApplicationController

 def new
 	@user=User.new
 end

 def index
 	
 end

 def create
 	
 end

#during signup checking email that already exist or not
def check_email
    @user= User.find_by(email: params[:user][:email].downcase)
      if @user.present?
          render json: false
      else
          render json: :true
      end  
 end
#when entering email during forgot password 
 def find_email
    @email_user= User.find_by(email: params[:user][:email].downcase)
     if @email_user.blank?
         render json: false
      else
          render json: :true
      end  
    end 

end
