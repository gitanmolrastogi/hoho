ActiveAdmin.register Order do

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
menu :priority=> 14

filter :created_at, label: "Order Date"
filter :is_paid, label: "Payment Status"

actions :all, :except => [:edit,:destroy,:new]

index do |f|
      #column :id
      column "Order Type" do |resource|
          type = resource.orderable_type
      	  if type == "Activity"
                "Activity"
      	  # elsif type == "MainRoute" 
          #        "Fixed Route"
      	  # elsif type == "Bus"
      	  # 	    "Hop Routes"
          elsif type == "Pass"
                "Pass"
      	  end 
      end

      column "Order Details" do |resource|
      	  type = resource.orderable_type
      	  if type == "Activity"
                Activity.find_by(id: resource.orderable_id)
      	  # elsif type == "MainRoute" 
          #        MainRoute.find_by(id: resource.orderable_id)
      	  # elsif type == "Bus"
      	  # 	   var = Bus.find_by(id: resource.orderable_id)
          elsif type == "Pass"	   
              Pass.find_by(id: resource.orderable_id)
      	  end  	
      end

      # column "Order Date" do |resource|
      # 	  type = resource.orderable_type
      # 	  if type == "Activity"
      #           #Activity.find_by(id: resource.orderable_id)
      #           "Avail within 7 days"
      # 	  elsif type == "MainRoute" 
      #           #MainRoute.find_by(id: resource.orderable_id)
      #           "Avail within 7 days"
      # 	  elsif type == "Bus"
      # 	  	   var = Bus.find_by(id: resource.orderable_id).start_date
      # 	  end  	
      # end
      column "Order Date" do |resource|
          resource.created_at
      end
       
       column "Payment"  do |resource|
         if resource.is_paid  
              "Yes" 
          else
               "No"
          end
      end
       column "User" do |resource|
          var = User.find_by(id: resource.user_id)
          var.first_name + " " + var.last_name
      end
      column "User Email" do |resource|
            User.find_by(id: resource.user_id).email rescue ""
      end
     actions name: "Actions"
    end
  #     column "Overview" do |resource|

  #      sanitize(truncate(resource.try(:overview).html_safe, omision: "...", length: 200, :escape => false))
      
  #     end
  #     # column "Information" do |resource|
  #     #   truncate(resource.try(:information).html_safe, omision: "...", length: 100, :escape => false)
  #     # end
  #    column :start_date
  #    column :end_date
  #    column :start_time do |time|
  #       time.start_time.present? ? time.start_time.strftime("%I:%M %p") : "00:00"
  #    end
  #   column :end_time do |time|
  #       time.end_time.present? ? time.end_time.strftime("%I:%M %p") : "00:00"
  #   end
  #   column :price,as: :string
  #   actions name: "Actions"
  # end

end
