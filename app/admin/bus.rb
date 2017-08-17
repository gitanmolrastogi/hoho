ActiveAdmin.register Bus do

filter :start_date
filter :end_date
filter :start_time
filter :end_time
filter :start_point
filter :end_point
permit_params :start_date ,:end_date ,:start_time,:end_time  ,:start_point , :end_point,:price

index do |f|
     selectable_column
     column :start_date
     column :end_date
     column :start_time do |time|
         time.start_time.strftime("%I:%M %p")
     end
    column :end_time do |time|
         time.end_time.strftime("%I:%M %p")
     end
     #column :start_point
     #column :end_point

     column "Start Point" do |n|
         n.start_point.try(:titleize)
     end
     column "End Point" do |n|
         n.end_point.try(:titleize)
     end
     actions name: "Actions"
end


form do |f|
    f.inputs do
      f.input :start_date,as: :datepicker
      f.input :end_date,as: :datepicker
      f.input :start_time, :ampm=> true,prompt: {hour: "Choose   Hour", minute: 'Choose minute'},include_blank: false, include_hidden: false
      f.input :end_time, :ampm=> true,prompt: {hour: "Choose   Hour", minute: 'Choose minute'},include_blank: false, include_hidden: false
      f.input :start_point ,:as => :select, :collection => (City.all.map{|u| ["#{u.name}".capitalize, "#{u.name}".capitalize]}).sort,include_blank: false, include_hidden: false
      f.input :end_point, :as => :select, :collection => (City.all.map{|u| ["#{u.name}".capitalize, "#{u.name}".capitalize]}).sort, input_html: {class: "select_start_bus"},include_blank: false, include_hidden: false
      f.input :price, as: :string
      # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false

    end
  actions
end

show :title=> "Route Management" do |route|
    attributes_table do  
  row :start_date
  row :end_date
  
  row "start_time" do |r|
    r.start_time.strftime("%I:%M %p")
  end 
   row "end_time" do |r|
    r.end_time.strftime("%I:%M %p")
  end 
  # row :start_point
  # row :end_point
  row "Start Point" do |n|
    n.start_point.try(:titleize)
  end
  row "End Point" do |n|
    n.end_point.try(:titleize)
  end
  row :price

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

   def create
      create! { |success,failure|
               success.html do
            redirect_to(admin_buses_path)
      end
      }
   end 
end
end


#.gsub("abc", "---")