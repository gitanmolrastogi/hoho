class User::RoutesController < ApplicationController
before_filter :check_for_main_routes , only: [:index]
	def index
		@current_route = (params[:route_id].present? and MainRoute.find_by_id(params[:route_id]).present?) ? MainRoute.find(params[:route_id]) : MainRoute.first
    @image = params[:route_id].present? ? @current_route.image.url : HomePageImage.first.image.url
		@route_dropdown = MainRoute.all
			if @current_route.line_color_routes.blank?
				  redirect_to '/' 
			    flash[:notice] = "No Routes have been added yet"
			    return
			end
		route = @current_route.line_color_routes.first
		# @weeks = route.try(:duration).try(:to_i)/7
  #       @days = route.try(:duration).try(:to_i) - @weeks*7
		@city_dropdown = (route.cities + City.where(name: @current_route.start_point)).uniq
		@city = @city_dropdown.last
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
		@category = @city_categories.first
		@posssible_routes = @current_route.line_color_routes
        @buses = MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id" RIGHT OUTER JOIN "buses" ON "buses"."start_point" = "cities"."name"').select("main_routes.id","main_routes.name","cities.id as city_id","cities.name as city_name", "buses.id as bus_id","buses.start_date as bus_start_date","buses.end_date as bus_end_date","buses.start_time as bus_start_time","buses.end_time as bus_end_time","buses.start_point as bus_start_point","buses.end_point as bus_end_point").distinct.where(:main_routes => {id: @current_route.id})

    end

 def get_date_buses
  p "============================hello in get date buses #{params.inspect}"
  @buses = MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id" RIGHT OUTER JOIN "buses" ON "buses"."start_point" = "cities"."name"').select("main_routes.id","main_routes.name","cities.id as city_id","cities.name as city_name", "buses.id as bus_id","buses.start_date as bus_start_date","buses.end_date as bus_end_date","buses.start_time as bus_start_time","buses.end_time as bus_end_time","buses.start_point as bus_start_point","buses.end_point as bus_end_point").distinct.where(:buses => {start_date: params[:date]})
  p @buses

 end 
	def city_details
		@city = City.find_by_id(params[:city_id])
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
	end

	def category_details
		@category =  Category.find_by_id(params[:category_id])
        p "+++++++++++++++#{@category.inspect}+++++++++++++++"
        @activities =  @category.activities.where(city_id: params[:city_id])
    end

   #for point to point selection
  def hop_on_hop_off
    if params[:route_id].present? && params[:type] == "From"
      @current_route = MainRoute.find_by_id(params[:route_id]) 
      @cities=MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id"').select("main_routes.id","main_routes.name","cities.name as city_name","cities.id as city_id").where(:main_routes => {id: @current_route.id}).distinct.pluck("cities.id,cities.name")
    end  
    if params[:city_id].present? && params[:type] == "To"
       @city= City.find_by_id(params[:city_id])
       @cities = City.where(name: Bus.where(start_point: @city.name).pluck(:end_point)).pluck(:id,:name) 
       
    end  
      respond_to do |format|
        format.html 
        format.json  { render :json => {:cities=>@cities } }
      end
  end

  def bus_details
    from_city=City.find_by(id: params[:from_city_id])
    to_city=City.find_by(id: params[:to_city_id])
    @buses=Bus.where("start_point = ? and end_point =? and start_date >= ? " ,from_city.name, to_city.name , Date.current)
  end

  def check_for_main_routes
    if MainRoute.count == 0 
       redirect_to '/'
       flash[:notice] = "Currently there are no main routes Available"
    end  
  end
		
end
