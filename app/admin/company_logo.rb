ActiveAdmin.register CompanyLogo do

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
permit_params :image ,:id


index do
    column :image do |img|
      image_tag(img.image_url, size: "120x90")
    end
     actions name: "Actions"
  end
 
show :title=> "Image" do |ad|
    attributes_table do  
    row  :image do |img|
      image_tag(img.image_url, size: "280x210")
    end
    
   end
end

form do |f|
    f.inputs "New Company Logo" do     
      f.input :image,:as => :file, label: "Image (preferable 1600 x 900 px)"#, :hint => f.object.image.present? ? image_tag(l.object.image.url, :width => 280, :height => 210) : ""
    end
     f.actions
  end

end
