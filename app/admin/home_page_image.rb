ActiveAdmin.register HomePageImage do
 before_filter :skip_sidebar!
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :image, :status
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
  	selectable_column
    column :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    column :status
    actions
  end
 
show :title=> "Image" do |ad|
    attributes_table do	 
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row  :status
   end
end


  form do |f|
    f.inputs "New Home Page Image" do     
      f.input :image,:as => :file
      f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false
    end
     f.actions
  end



end
