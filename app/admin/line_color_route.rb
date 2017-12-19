ActiveAdmin.register LineColorRoute do

filter :name 
# filter :price 
filter :duration

actions :all, :except => [:edit,:destroy]
permit_params :name , :duration , :image,:image_credit, :zoomed_image,:image_credit_zoomed,:main_route_id ,city_routes_attributes: [:id, :city_id ,:priority ,:_destroy]


form do  |f|
  f.inputs do
    f.input :main_route_id ,:as => :select, :collection => (MainRoute.all.map{|u| ["#{u.name}".titleize, u.id]}).sort , :include_blank => false #, input_html: {class: "select_city",id: "select_city_id"}
    f.input :name
      f.inputs "Please select the stops points as their sequences!!" do
          f.has_many :city_routes  do |l|
              l.input :city_id ,:as => :select, :collection => (City.all.map{|u| ["#{u.name}".titleize, u.id]}).sort,:include_blank => false, input_html: {class: "select_city"}
              a = 1..100
             # puts "-----------------------------------------------------------------------------"
              if  request.original_url.include?("edit") 
               l.input :_destroy, :as => :boolean, :label => "Delete"
              end
          end
      end
    # f.input :duration ,:label => 'Duration in Days'
    f.input :image, as: :file, label: "Image (preferably 1600 x 900 px)"
    f.input :image_credit
    f.input :zoomed_image , as: :file, label: "Zoomed Image (preferably 1600 x 900 px)"
    f.input :image_credit_zoomed, :label => "Image Credit"
  end
  actions
end

index do
   # selectable_column
    #column :name
    column "Name" do |n|
      n.name.titleize
    end
    column "Main Route" do |n|
       MainRoute.find_by(id: n.main_route_id)
    end
    column  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    column :image_credit
    column  :zoomed_image do |img|
      image_tag img.zoomed_image_url(:homepage_images)
    end
    column "Image Credit" do |n|
      n.image_credit_zoomed
    end
    # column :created_at
    #actions name: "Actions"


    column 'Status' do |resource|
      if (resource.is_active == true)
        '<i class = "status_tag yes"> Available </i>'.html_safe
      else
        '<i class = "status_tag no"> Blocked </i>'.html_safe
      end
    end
    actions name: "Actions" do |ff|      
      a do 
        if (ff.is_active == true)
          link_to 'Block' , block_line_color_routes_admin_line_color_routes_path(id: ff.id),
              data: { confirm: 'Are you sure you want to Block?' }
        else
          link_to 'Unblock' , block_line_color_routes_admin_line_color_routes_path(id: ff.id),
              data: { confirm: 'Are you sure you want to Unblock?' }
        end
      end
      
     end
end

collection_action :block_line_color_routes, method: :get do
         line_color_route = LineColorRoute.find(params[:id]) 
         if (line_color_route.is_active == true)
          line_color_route.update_attributes(:is_active => false)
          redirect_to  :back
        else
          line_color_route.update_attributes(:is_active => true)
          redirect_to  :back
        end
     end

show :title=> "Route Management" do |route|
    attributes_table do	
    #0row :name
    row "Name" do |n|
        n.name.try(:titleize)
    end
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row :image_credit
    row  :zoomed_image do |zoomed_image|
      image_tag zoomed_image.zoomed_image_url(:homepage_images)
    end
    row "Image Credit" do |n|
      n.image_credit_zoomed
    end
    row :hops do |route|
      #route.cities.pluck(:name).map(&:titleize).join(", ")
      arr = []
      route.city_routes.each do |c_r|
        arr << City.find_by(id: c_r.city_id).try(:name).titleize
      end 
      arr.join(",")
    end
    # row :created_at
    # row :updated_at
    	# row :price
    	# row :duration
   end
end



controller do
  def to_s
    self.name.to_s
  end

  def create
             super do |success,failure|
               success.html { redirect_to  admin_line_color_routes_path ,notice: 'Line color route  was successfully created.' }
               failure.html { redirect_to :back, :alert => "Line color route was not successfully created !!!" }
             end
    end


    def create
         super do |success,failure|
               success.html { redirect_to admin_line_color_routes_path ,notice: 'Line color route  was successfully created.' }
               failure.html { 

                    if resource.errors.any?
                       redirect_to :back, :alert => "Line Color Route already exists." 
                    else
                       redirect_to :back, :alert => "Oops! Something went wrong." 
                    end


              }
         end
    end  
end


end





