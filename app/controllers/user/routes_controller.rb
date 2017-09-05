class User::RoutesController < ApplicationController
before_filter :check_for_main_routes , only: [:index]
	def index
		@current_route = (params[:route_id].present? and MainRoute.find_by_id(params[:route_id]).present?) ? MainRoute.find(params[:route_id]) : MainRoute.first
    @image = params[:route_id].present? ? @current_route.image.url : MainRoute.first.image.url
    @image_credit = params[:route_id].present? ? @current_route.image_credit : MainRoute.first.image_credit
		@route_dropdown = MainRoute.all.sort{|left,right| left.name <=> right.name}  #MainRoute.all
			if @current_route.line_color_routes.blank?
				  redirect_to '/' 
			    flash[:notice] = "No Routes have been added yet"
			    return
			end
		route = @current_route.line_color_routes.first
		# @weeks = route.try(:duration).try(:to_i)/7
    # @days = route.try(:duration).try(:to_i) - @weeks*7
		@city_dropdown = ((route.cities + City.where(name: @current_route.start_point)).uniq).sort{|left,right| left.name <=> right.name}
		@city = @city_dropdown.last
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
		@category = @city_categories.first
		@posssible_routes = @current_route.line_color_routes
    @buses = MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id" RIGHT OUTER JOIN "buses" ON "buses"."start_point" = "cities"."name"').select("main_routes.id","main_routes.name","cities.id as city_id","cities.name as city_name", "buses.id as bus_id","buses.start_date as bus_start_date","buses.end_date as bus_end_date","buses.start_time as bus_start_time","buses.end_time as bus_end_time","buses.start_point as bus_start_point","buses.end_point as bus_end_point").distinct.where(:main_routes => {id: @current_route.id})

    end

 def get_date_buses
    #@buses = MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id" RIGHT OUTER JOIN "buses" ON "buses"."start_point" = "cities"."name"').select("main_routes.id","main_routes.name","cities.id as city_id","cities.name as city_name", "buses.id as bus_id","buses.start_date as bus_start_date","buses.end_date as bus_end_date","buses.start_time as bus_start_time","buses.end_time as bus_end_time","buses.start_point as bus_start_point","buses.end_point as bus_end_point").distinct.where(:buses => {start_date: params[:date]})
 end 
	def city_details
		@city = City.find_by_id(params[:city_id])
		@city_categories = Category.where(id: @city.try(:activities).pluck(:category_id))
	end

	def category_details
		@category =  Category.find_by_id(params[:category_id])
    @activities =  @category.activities.where(city_id: params[:city_id])
  end







   #for point to point selection
  def hop_on_hop_off
    if params[:route_id].present? && params[:type] == "From"
      @current_route = MainRoute.find_by_id(params[:route_id]) 
      #@cities=(MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id"').select("main_routes.id","main_routes.name","cities.name as city_name","cities.id as city_id").where(:main_routes => {id: @current_route.id}).distinct.pluck("cities.id,cities.name") + City.where(name: MainRoute.find_by_id(@current_route.id).start_point.downcase!).pluck(:id,:name)).sort{|a,b| a[1] <=> b[1]}
      city = []
      @current_route.line_color_routes.each do |a|
             a.city_routes.pluck(:city_id).each do |b|
                city << b
             end
      end
      @cities = City.where(id: city.uniq).pluck(:id,:name)



    end  
    if params[:route_id].present? && params[:type] == "To"
       #@city= City.find_by_id(params[:city_id])
       # @cities = City.where(name: Bus.where(start_point: @city.name).pluck(:end_point)).pluck(:id,:name) 
       #@cities = (City.where(name: Bus.where(start_point: @city.name).pluck(:end_point)).pluck(:id,:name)).sort{|a,b| a[1] <=> b[1]}
       @current_route = MainRoute.find_by_id(params[:route_id]) 
      cit = []
      @current_route.line_color_routes.each do |a|
             a.city_routes.pluck(:city_id).each do |b|
                cit << b
             end
      end
      arr = cit.uniq
      arr.delete(params[:city_id].to_i)
      # p "------#{arr}--#{params[:city_id].to_i}-------"
      @cities = City.where(id: arr).pluck(:id,:name)

    end  
      respond_to do |format|
        format.html 
        format.json  { render :json => {:cities=>@cities } }
      end
  end







  def bus_details
    from_city=City.find_by(id: params[:from_city_id])
    to_city=City.find_by(id: params[:to_city_id])
    #@buses=Bus.where("start_point = ? and end_point =? and start_date >= ? " ,from_city.name, to_city.name , Date.current)

       
    find_routes_for_from_and_to(from_city,to_city)

     #p "-------#{@line_id}-------"

     bus_available(from_city,to_city)

     #p "--------#{@variable}---------"


    

  end

  def check_for_main_routes
    if MainRoute.count == 0 
       redirect_to '/'
       flash[:warning] = "Currently there are no main routes Available"
    end  
  end
  # my code start here

  def find_routes_for_from_and_to(from_city,to_city)

     # Finding all the line color routes where a souce city belongs
     line_route_ids = CityRoute.where(city_id: from_city).distinct.pluck(:line_color_route_id)
    
      #p "-----------#{line_route_ids}---------------"
         @line_id = []  #For holding the line color route id after filtering
   
         line_route_ids.each do |a|
         #p "-------#{a}---------"

         # checking whether destination exits on that particular line route or not
         var_to = LineColorRoute.find(a).city_routes.where(city_id: to_city)
         if var_to.present?    
            var_from = LineColorRoute.find(a).city_routes.where(city_id: from_city)


        #checking the allowed direction of travel and saving the valid result in @line_id
              if (var_to.last.id - var_from.first.id) > 0
                #  p "------There is a route(#{LineColorRoute.find(a).name})--------------"
                  @line_id << a
              end 
         else
         # p "-------error----------"
         end
         end
  end

  def bus_available(from_city,to_city)
    @variable = @line_id
    #p "------aryan#{@line_id}----------"
    @buses = []

    #intial coding for bus generation

    # @variable.each do |q|
    #   #@buses = Bus.where(route_id: q)
  
    #     bus1 = Bus.find_by(route_id: q)
    #    if bus1
    #       freq = 7
    #       start_date = bus1.start_date
    #       end_date = bus1.end_date
    #       var = start_date - 7.days
    #         ((start_date..end_date).count/freq).times do 
    #            @buses << var = var + 7.days
    #         end
    #    end
    # end

    # end of initial coding for bus generation

    #New coding

    #looping through the routes which matches with the souce and destination
   var = []
     @line_id.each do |line|

         p "--------Route id: #{line}-From City#{from_city.name}---------"  

         bus = Bus.where(route_id: line)

         p "-----------Bus#{bus.count}------------"

         if !bus.nil?
         bus.each do |b|
           b.bus_timings.where(city_id: from_city)#.first.day_of_deperture

           p "------#{b.bus_timings}-----------"
         end
        end
      end


    @buses.sort!
  end
		
end
