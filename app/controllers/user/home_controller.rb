class User::HomeController < ApplicationController

def dashboard

	p "====dashboard==========#{current_user}"
	
end


end
