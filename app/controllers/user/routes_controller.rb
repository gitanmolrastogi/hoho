class User::RoutesController < ApplicationController

	def index
		@current_route = (params[:route_id].present? and LineColorRoute.find_by_id(params[:route_id]).present?) ? LineColorRoute.find(params[:route_id]) : LineColorRoute.last
		@route_dropdown = LineColorRoute.all

		@weeks = @current_route.duration.to_i/7
		@days = @current_route.duration.to_i - @weeks*7
		@city_dropdown = @current_route.cities + City.where(name: @current_route.start_point)
		@city = @city_dropdown.last
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
	end

	def city_details
		@city = City.find_by_id(params[:city_id])
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
				
	end


	def category_details
		puts "#{params.inspect}"

		
	end



end
