class User::UsersController < ApplicationController

 def new
 	@user=User.new
 end

 def index
 	
 end

 def create
 	
 end

 def get_city
  city = City.pluck(:name,:id)
  render :json => {:city => city}
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

# During change password check current password

  def check_current_password
    p "===cccccccccccccc=#{current_user.valid_password?(params[:user][:current_password])}============"
    if current_user.valid_password?(params[:user][:current_password])
      render json: :true
     else
      render json: :false
     end 
      
  end  

end
