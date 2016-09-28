ActiveAdmin.register LineColorRoute do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name , :start_point , :end_point , :price , :duration , :image,:zoomed_image
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
    f.input :end_point, :as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}
    f.input :price
    f.input :duration ,:label => 'Duration in Days'
    f.input :image, as: :file
    f.input :zoomed_image , as: :file
    # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false
  end
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
