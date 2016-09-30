ActiveAdmin.register LineColorRoute do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
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
    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
      f.inputs "Please select the stops points and their sequences!!" do
          f.has_many :city_routes  do |l|
              l.input :city_id ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", u.id]}
              l.input :priority , :as => :select, :collection => 1..100
              l.input :_destroy, :as => :boolean, :label => "Delete"
          end
      end
    f.input :end_point, :as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
    f.input :price
    f.input :duration ,:label => 'Duration in Days'
    f.input :image, as: :file
    f.input :zoomed_image , as: :file
  end
    # f.has_many :cities do |r|
    # r.input :city ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", u.id]}
    # end
  



  actions
end


show :title=> "Route Management" do |route|
    attributes_table do	 
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row  :zoomed_image do |img|
      image_tag img.image_url(:homepage_images)
    end
	row :name
	row :start_point
	row :end_point
	row :price
	row :duration
    # row  :status
   end
end


end
