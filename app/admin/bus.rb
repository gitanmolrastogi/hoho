ActiveAdmin.register Bus do

filter :start_date
filter :end_date
filter :start_time
filter :end_time
filter :no_of_seats
filter :start_point
filter :end_point


permit_params :start_date ,:end_date ,:start_time,:end_time ,:no_of_seats ,:start_point , :end_point




form do  |f|
  f.inputs do
    f.input :start_date,as: :datepicker
    f.input :end_date,as: :datepicker
    f.input :start_time
    f.input :end_time 
    f.input :no_of_seats , label: "Number of Seats"
    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
    f.input :end_point, :as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]} , input_html: {class: "select_start_bus"}
    # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false

  end
  actions
end





show :title=> "Route Management" do |route|
    attributes_table do  
  row :start_date
  row :end_date
  
  row "start_time" do |r|
    r.start_time.strftime("%H:%M")
  end 
   row "end_time" do |r|
    r.end_time.strftime("%H:%M")
  end 
  row :no_of_seats
  row :start_point
  row :end_point


    # row  :status
   end
end
















controller do 
   def date_format
      # p "-----#{params[:city][:name].inspect}---------"
      if params[:bus].present?
           start_date= params[:bus][:start_date].to_s
            # start_date =start_date.gsub("/", "-")
            # start_date = start_date.gsub(' \" ', "")

           p "=======sdddd===#{start_date.inspect}======="
           # params[:bus][:start_date] = start_date
           params[:bus][:end_date] = params[:bus][:end_date].gsub("/", "-")

      end

  end 

 end


end


#.gsub("abc", "---")