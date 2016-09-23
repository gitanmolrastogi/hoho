ActiveAdmin.register StaticPage do
menu false
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :content, :type
actions :all, :except => [:destroy]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end




  form do |f|
    f.inputs "New Static Content" do     
     
      f.input :title, :label => "Title" ,:input_html => {:placeholder => "Please Enter alphabets only! and length should be 5-30", :disabled => true}
      f.input :content, as:  :ckeditor,  :label => "Description" ,:input_html => {:placeholder => "Add a description min. length should be 30"}

    end
     f.actions
 
  end
 

 show :title=> "Content" do |ad|
    attributes_table do	 
    row  :title 
    row  "Content" do 
    	ad.content.html_safe
    end
   end
end

 

end
