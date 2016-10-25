ActiveAdmin.register Bus do

filter :start_date
filter :end_date
filter :start_time
filter :end_time
filter :start_point
filter :end_point
permit_params :start_date ,:end_date ,:start_time,:end_time  ,:start_point , :end_point



index do |f|
     selectable_column
     column :start_date
     column :end_date
     column :start_time do |time|
         time.start_time.strftime("%H:%M")
     end
    column :end_time do |time|
         time.start_time.strftime("%H:%M")
     end
     column :start_point
     column :end_point
     actions

end


form do |f|
    f.inputs do
      f.input :start_date,as: :datepicker
      f.input :end_date,as: :datepicker
      f.input :start_time
      f.input :end_time 
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