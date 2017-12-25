ActiveAdmin.register Category do
config.remove_action_item(:destroy)
before_filter :downcase_category
filter :name
permit_params :name, :image, :info, :image_credit

# form do  |f|
#   f.inputs do
#     # f.input :name #,:input_html=>{:disabled=>true} if params[:action]=="edit"
#     f.input :name # if params[:action]=="new"
#     f.input :info,as: :ckeditor
#     f.input :image, as:  :file
#   end
#   actions
# end

member_action :block, method: :get do 
  category = Category.find_by(id: params[:id]) 
        
        if category.present?
            status = !(category.is_active)
            category.update_attributes(:is_active => status)
        end
       redirect_to :back
end


form do |f|
    f.inputs do
          # f.input :name #,:input_html=>{:disabled=>true} if params[:action]=="edit"
    f.input :name # if params[:action]=="new"
    f.input :info,as: :ckeditor, label: "Information"
    f.input :image, label: "Image (preferably 1200X900 px)" ,as:  :file
    #f.input :image, label: "Image (preferably 1200x900 px)" ,:hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""
    f.input :image_credit, :input_html => {:maxlength => 100}
      # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false

    end
  actions
end

index do |f|
     selectable_column
     column :name do |n|
        n.name.try(:titleize)
     end 
     column "Information" do |body|
        sanitize(body.info.truncate(50).html_safe)
     end
     # column :created_at
     column "Status" do |a|
      if a.is_active
        '<i class = "status_tag yes"> Unblocked </i>'.html_safe
      else
        '<i class = "status_tag no"> Blocked </i>'.html_safe
      end
    end
    column "Actions" do |f|
      a do 
        link_to "view", admin_category_path(f)
      end
      a do 
        link_to "edit", edit_admin_category_path(f)
    end
    a do 
      if f.is_active
         link_to "block", block_admin_category_path(f),
              data: { confirm: 'Are you sure you want to Block?' }
      else
         link_to "unblock", block_admin_category_path(f),
              data: { confirm: 'Are you sure you want to Unblock?' }
      end
    end
  end
  end


show do |route|
    attributes_table do  
    #row :name
    row "Name" do |n|
       n.name.try(:titleize)
    end
    row "Information" do |body|
        body.try(:info).try(:html_safe)
     end
    row  :image do |img|
        image_tag img.image_url(:homepage_images)
     end
    row :image_credit
      # row :created_at
      # row :updated_at
    end
end

controller do 
   def downcase_category
   	   p "====#{params[:category].inspect}=="
   	  if params[:category].present?
   	       params[:category][:name] = params[:category][:name].downcase
      end
   end	

   def create
          super do |success,failure|
               success.html { redirect_to admin_categories_path ,notice: 'Category  was successfully created.' }
               failure.html { redirect_to :back, :alert => "Please fill in the Information" }
          end
 
   end

   def update
          super do |success,failure|
               success.html { redirect_to admin_categories_path ,notice: 'Category was successfully updated.' }
               failure.html { redirect_to :back, :alert => "Category was not successfully updated." }
          end 
   end
 end
end