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
      p "=========#{params.inspect}==========="
    if params[:route_id].present? && params[:type] == "From"
      @current_route = MainRoute.find_by_id(params[:route_id]) 
      @cities=@current_route.line_color_routes.first.cities
    end  
    if params[:city_id].present? && params[:type] == "To"
       @city= City.find_by_id(params[:city_id])
       p "========cittttttttttt====#{@city.inspect}"
       @cities = City.where(name: Bus.where(start_point: @city.name).pluck(:end_point)) 
       p "======to city ===#{@cities.inspect}====="
   end  
      respond_to do |format|
        format.html 
        format.json  { render :json => {:cities=>@cities } }
      end
     
    end

  def check_for_main_routes
    if MainRoute.count == 0 or LineColorRoute.count == 0
       redirect_to '/'
       flash[:notice] = "Currently there are no routes Available"
    end  
  end


end
