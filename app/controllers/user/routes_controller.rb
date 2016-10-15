class User::RoutesController < ApplicationController

	def index
		@current_route = (params[:route_id].present? and LineColorRoute.find_by_id(params[:route_id]).present?) ? LineColorRoute.find(params[:route_id]) : LineColorRoute.last
		@route_dropdown = LineColorRoute.all
		@weeks = @current_route.try(:duration).to_i/7
		@days = @current_route.try(:duration).to_i - @weeks*7
		#cities
		@city_dropdown = @current_route.try(:cities) + City.where(name: @current_route.try(:start_point))
		@city = @city_dropdown.try(:last)
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
		p "==================#{@city.inspect}=======================#{@city_categories.inspect}================="
	end

	def city_details
		puts "#{params.inspect}"
		# render json: {:hello => "HELLOOOO"}
		@city = City.find_by_id(params[:city_id])
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
		p "===============cate in city_details==========================#{@city_categories.inspect}================="
				
	end


	def category_details
		puts "#{params.inspect}"

		
	end



end
