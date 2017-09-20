class User::RoutesController < ApplicationController
before_filter :check_for_main_routes , only: [:index]
	def index
		@current_route = (params[:route_id].present? and MainRoute.find_by_id(params[:route_id]).present?) ? MainRoute.find(params[:route_id]) : MainRoute.find_by(id: LineColorRoute.where(is_active: true).first.main_route_id)
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
    #@buses = MainRoute.joins(:line_color_routes).joins('LEFT OUTER JOIN "city_routes" ON "city_routes"."line_color_route_id" = "line_color_routes"."id" LEFT OUTER JOIN "cities" ON "cities"."id" = "city_routes"."city_id" RIGHT OUTER JOIN "buses" ON "buses"."start_point" = "cities"."name"').select("main_routes.id","main_routes.name","cities.id as city_id","cities.name as city_name", "buses.id as bus_id","buses.start_date as bus_start_date","buses.end_date as bus_end_date","buses.start_time as bus_start_time","buses.end_time as bus_end_time","buses.start_point as bus_start_point","buses.end_point as bus_end_point").distinct.where(:main_routes => {id: @current_route.id})
    @buses = [{"bus_start_date" => Date.today ,"bus_id" => 1}, {"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today ,"bus_id" => 1},{"bus_start_date" => Date.today+2.day ,"bus_id" => 1}]
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

      

    #@cities = []
        @cities.each do |city| 
              city[1] = city[1].titleize if city.present?

        end




    end  
    if params[:route_id].present? && params[:type] == "To"
       #@city= City.find_by_id(params[:city_id])
       # @cities = City.where(name: Bus.where(start_point: @city.name).pluck(:end_point)).pluck(:id,:name) 
       #@cities = (City.where(name: Bus.where(start_point: @city.name).pluck(:end_point)).pluck(:id,:name)).sort{|a,b| a[1] <=> b[1]}
       

      #my code starts here...

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
       @cities.each do |city| 
              city[1] = city[1].titleize if city.present?

        end
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
     bus_available(from_city,to_city)
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
    
         @line_id = []  #For holding the line color route id after filtering
   
         line_route_ids.each do |a|

           if LineColorRoute.find_by(id: a).is_active

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
  end
   # my code for finding the bus that are available  
  def bus_available(from_city,to_city)
    @variable = @line_id
    @buses = []
   # p "--------Current User(#{current_user.id})---------------"
          #freq = 7
      
      @line_id.each do |line|
           available_buses = Bus.where(route_id: line, status: true)
         #  p "--------Line Id: #{line}--Bus #{available_buses.present?}---------"

           if available_buses

                available_buses.each do |bus|
                   # p "---------Bus#{bus.bus_timings.find_by(city: from_city.name).day_of_deperture}-City#{from_city.name}----------"
                    

                     freq = bus.frequency
                     bus_time = bus.bus_timings
                       

                    start_date = bus.start_date + (day_offset = (bus_time.find_by(city: from_city.name).day_of_deperture - 1)).day
                    end_date = bus.end_date + (bus_time.find_by(city: from_city.name).day_of_deperture - 1).day

                   # p "-------Start #{start_date}--End #{end_date}-------"                   

                    var = start_date - freq.day
                   # p "----------var#{var}------------"

                    (start_date..end_date).step(freq) do |date|

                      if (Date.today <= date) && seat_availability(bus,(date - day_offset.day))
                        @buses << {"user_id" => current_user,"bus_id" => bus.id, "date" => date, "start_date" => (date - day_offset.day), "start_time" => bus_time.first.deperture ,"route" => LineColorRoute.find(line).name ,"source" => from_city.name.titleize,  "departure" => bus_time.where(city: from_city.name).first.deperture,"destination" => to_city.name.titleize, "arrival" => bus_time.where(city: from_city.name).last.arrival }
                      end
                    
                    end
                end
           end
      end
      @buses = @buses.sort_by{ |hash| hash["date"]}
  end

  # my code for booking management of buses 

  def bus_booking
          # checking whether user is logged in or not
              if current_user
        
                        if (pass_booking = PassBooking.where("user_id = ? AND default_pass =?", params[:bus][:user_id], true))
                            if pass_booking.present?
                                pass_catg = pass_booking.first.category

                                if pass_catg == "Open"
                               #     p "---------Open Pass is selected#{pass_booking.first.route}---------"
                                     
                                     route_exist = false
                                                MainRoute.find_by(name: pass_booking.first.route).line_color_routes.pluck(:name).each do |r|

                                                    if r == params[:bus][:route]
                                                        route_exist = true
                                                    end
                                                 end
                                                
                                                if route_exist
                                                   bus_booking_create(pass_booking)
                                                else
                                                   redirect_to :back
                                                   flash[:warning] = "Please select a pass for this route."
                                                end


                                elsif pass_catg == "Closed"
                         
                                    if pass_booking.first.route == params[:bus][:route]
                                          bus_booking_create(pass_booking)                     
                                    else
                                          redirect_to :back
                                          flash[:warning] = "Please select a pass for this route."
                                    end           
                                end

                            else
                                  redirect_to :back
                                  flash[:warning] = "Please select a pass for this route.Buy a Pass"
                            end

                        else
                            redirect_to :back
                            flash[:warning] = "Please select a pass for this route."
                        end

              else
                     redirect_to :back
                     flash[:warning] = "Please login first to book buses"
              end

  end
	

  def bus_booking_create(pass_booking)
     #  p "------You have created#{pass_booking}--------"
        # checking whether the user has hops available and pass validity.


            if  ((( hops_count = pass_booking.first.hops_remaining )  > 0) && ( (Date.parse(params[:bus][:date]) <= pass_booking.first.valid_upto) && (Date.parse(params[:bus][:date]) >= pass_booking.first.valid_from)  ))                      
                      book = Booking.new(bus_booking_params)
                      
                      if book.save
                           if pass_booking.first.hops_remaining == Pass.find_by(id: pass_booking.first.pass_id).max_hops
                               #pass_booking.first.update(valid_upto:  (Pass.find_by(id: pass_booking.first.pass_id).validity).day + DateTime.parse(params[:bus][:date]))
                          
                                pass_booking.first.update(valid_from: Date.parse(params[:bus][:date]),valid_upto: Date.parse(params[:bus][:date]) + ((Pass.find_by(id: pass_booking.first.pass_id).validity)-1).day)

                               # p "--- I am here whatever------"

                           end
                           Booking.last.update(pass_id: pass_booking.first.pass_id)
                           pass_booking.first.update(hops_remaining: (hops_count -1))
                           redirect_to hop_on_hop_off_user_routes_path
                           flash[:success] = "Bus has been successfully booked !!!"
                      else
                           flash[:warning] = "Booking Failed. Please try again." 
                           redirect_to :back
                      end
            else
                redirect_to :back
                flash[:warning] = "Pass has expired."
            end
  end

  
  # my code for seat availability

  def seat_availability(bus,bus_start_date)
      
      Booking.where(start_date: bus_start_date, bus_id: bus.id).count < bus.capacity #  seat capacity.
 
  end







  private 

  def bus_booking_params
      params.require(:bus).permit(:user_id,:bus_id, :date, :start_date, :start_time, :route,:source, :destination,:arrival, :departure )
  end

end
