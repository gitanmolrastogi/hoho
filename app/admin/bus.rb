ActiveAdmin.register Bus do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
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
    f.input :start_date
    f.input :end_date

    
    f.input :start_time
    f.input :end_time ,:label => 'Duration in Days'
    f.input :no_of_seats

    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
    f.input :end_point, :as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
    # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false

  end
  actions
end




end
