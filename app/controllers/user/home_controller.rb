class User::HomeController < ApplicationController

def dashboard

	p "====dashboard==========#{current_user}"
	
end

def read_more
   p "=read_more =#{params.inspect}=================="
   @object= StaticPage.find_by(id: params[:object_id])
   p "=======finddd===#{@object.inspect}======="	
end

def read_less
   p "=read_less =#{params.inspect}=================="
   @object= StaticPage.find_by(id: params[:object_id])
   p "=======finddd===#{@object.inspect}======="	
end

end
