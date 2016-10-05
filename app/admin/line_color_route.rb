ActiveAdmin.register LineColorRoute do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#


filter :name 
filter :start_point 
filter :end_point 
filter :price 
filter :duration


permit_params :name , :start_point , :end_point , :price , :duration , :image, :zoomed_image, city_routes_attributes: [:id, :city_id ,:priority ,:_destroy]
# accepts_nested_attributes_for :cities, :allow_destroy => true

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do  |f|
  f.inputs do
    f.input :name
    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}, input_html: {class: "select_city",id: "select_city_id"}
      f.inputs "Please select the stops points as their sequences!!" do
          f.has_many :city_routes  do |l|
              l.input :city_id ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", u.id]},:include_blank => true, input_html: {class: "select_city"}
              a = 1..100
              # l.input :priority , :label => 'Sequence Number', :as => :select, :collection => a , input_html: {class: "priority",id: "priority_id"}
              puts "-----------------------------------------------------------------------------"
              if  request.original_url.include?("edit") 
               l.input :_destroy, :as => :boolean, :label => "Delete"
              end
          end
      end
    f.input :end_point, :as => :select, :collection => [],:include_blank => false
    f.input :price
    f.input :duration ,:label => 'Duration in Days'
    f.input :image, as: :file
    f.input :zoomed_image , as: :file
  end

  actions
end


show :title=> "Route Management" do |route|
    attributes_table do	 
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row  :zoomed_image do |img|
      image_tag zoomed_img.image_url(:homepage_images)
    end
 a = route.cities.pluck(:name)
 p a
    row :hops do |route|
    route.cities.pluck(:name).join(", ")
    end

	row :name
	row :start_point
	row :end_point
	row :price
	row :duration
    # row  :status
   end
end



controller do
  def to_s
    self.name.to_s
  end
  end


end
