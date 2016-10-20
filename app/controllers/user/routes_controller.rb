class User::RoutesController < ApplicationController
   before_filter :check_for_main_routes , only: [:index]
	def index
		@current_route = (params[:route_id].present? and MainRoute.find_by_id(params[:route_id]).present?) ? MainRoute.find(params[:route_id]) : MainRoute.first
		@route_dropdown = MainRoute.all
			if @current_route.line_color_routes.blank?
				redirect_to dashboard_path 
			    flash[:alert] = "No Routes have been added yet"
			    return
			end
		@weeks = @current_route.line_color_routes.first.duration.to_i/7
		@days = @current_route.line_color_routes.first.duration.to_i - @weeks*7
		@city_dropdown = @current_route.line_color_routes.first.cities + City.where(name: @current_route.start_point)
		@city = @city_dropdown.last
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
		@category = @city_categories.first
		@posssible_routes = @current_route.line_color_routes

	end

	def city_details
		@city = City.find_by_id(params[:city_id])
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
	end

	def category_details
		puts "#{params.inspect}"
		@category =  Category.find_by_id(params[:category_id])
		p "+++++++++++++++#{@category.inspect}+++++++++++++++"
		@activities =  @category.activities.where(city_id: params[:city_id])
	end

private
	def check_for_main_routes
		redirect_to dashboard_path if MainRoute.count == 0 or LineColorRoute.count == 0
		flash[:alert] = "Currently there are no routes Available"
	end
end
