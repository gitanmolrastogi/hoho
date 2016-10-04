ActiveAdmin.register Bus do
# before_filter :date_format
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

filter :start_date
filter :end_date
filter :start_time
filter :end_time
filter :no_of_seats
filter :start_point
filter :end_point



permit_params :start_date ,:end_date ,:start_time,:end_time ,:no_of_seats ,:start_point , :end_point
#end_time
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



form do  |f|
  f.inputs do
    f.input :start_date,as: :datepicker
    f.input :end_date,as: :datepicker
    f.input :start_time
    f.input :end_time 
    f.input :no_of_seats
    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
    f.input :end_point, :as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]} , input_html: {class: "select_start_bus"}
    # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false

  end
  actions
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