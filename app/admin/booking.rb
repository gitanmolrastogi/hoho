ActiveAdmin.register Booking do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
menu :priority=> 15

actions :all, :except => [:edit,:destroy,:new]

filter :date
filter :route
filter :destination
filter :start_date
#filter :user_id

filter :user_id, label: 'User', as: :select,
        collection: proc { User.pluck(:email,:id) }



index do |f|
     selectable_column
      column :id
      column "Date of Booking" do |resource|
          resource.date 
      end
      column :route
      column "Bus Id" do |resource|
      	  resource.bus_id
       end
      column :source
      column :destination
      column "Arrival" do |resource|
      	resource.arrival.strftime("%I:%M %p") rescue "" 
      end
      column "Departure" do |resource|
      	resource.departure.strftime("%I:%M %p") rescue "" 
       end
      column :start_date
      column "User" do |resource|
        User.find_by(id: resource.user_id).email
       end


end



end
