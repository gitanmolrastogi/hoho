class User::RoutesController < ApplicationController
    before_filter :check_for_main_routes , only: [:index]
	  def index
        @current_route = (params[:route_id].present? and MainRoute.find_by_id(params[:route_id]).present?) ? MainRoute.find(params[:route_id]) : MainRoute.last
        @route_dropdown = MainRoute.all
        @weeks = @current_route.line_color_routes.first.duration.to_i/7
        @days = @current_route.line_color_routes.first.duration.to_i - @weeks*7
        @city_dropdown = @current_route.line_color_routes.first.cities + City.where(name: @current_route.start_point)
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

   #for point to point selection
    def hop_on_hop_off
        p "=========params==#{params[:route_id].inspect}===="
      @current_route = (params[:route_id].present? and MainRoute.find_by_id(params[:route_id]).present?) ? MainRoute.find(params[:route_id]) : MainRoute.last
      # render :json => @current_route 
      @cities=@current_route.line_color_routes.first.cities
      render :json => {:data=>@cities } 
      puts "------route--------#{@current_route.inspect}------@cities--#{@cities.inspect}--"

    end

  def check_for_main_routes
        redirect_to dashboard_path if MainRoute.count == 0 or LineColorRoute.count == 0
        flash[:notice] = "Currently there are no routes Available"
    end


end
