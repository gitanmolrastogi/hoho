class User::HomeController < ApplicationController

def dashboard

	p "====dashboard==========#{current_user}"
	@tweet = Client.user_timeline("KumarMobiloitte").first
	@client = Instagram.client(:access_token => "4015370471.b8cf69e.a9e57a45341d400ba3853c3dac8119a3")
	@recent = @client.user_recent_media.take(3)
	@arr = []
	@recent.each do |f|
		h = {}
		h["pic"]  = f.images.standard_resolution.url
		h["tags"] = f.tags
		h["name"] = f.user.full_name
		h["time"] = f.created_time
		@arr << h
	end
end

def read_more
   p "=read_more =#{params.inspect}=================="
   @object= HowItWork.find_by(id: params[:object_id])
   p "=======finddd===#{@object.inspect}======="	
end

def read_less
   p "=read_less =#{params.inspect}=================="
   @object= HowItWork.find_by(id: params[:object_id])
   p "=======finddd===#{@object.inspect}======="	
end

end
