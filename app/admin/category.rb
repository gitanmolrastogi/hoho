ActiveAdmin.register Category do

before_filter :downcase_category
filter :name
permit_params :name, :image, :info

# form do  |f|
#   f.inputs do
#     # f.input :name #,:input_html=>{:disabled=>true} if params[:action]=="edit"
#     f.input :name # if params[:action]=="new"
#     f.input :info,as: :ckeditor
#     f.input :image, as:  :file
#   end
#   actions
# end

form do |f|
    f.inputs do
          # f.input :name #,:input_html=>{:disabled=>true} if params[:action]=="edit"
    f.input :name # if params[:action]=="new"
    f.input :info,as: :ckeditor, label: "Information"
    f.input :image, as:  :file
      # f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false

    end
  actions
end

index do |f|
     selectable_column
     column :name  
     column "Information" do |body|
        sanitize(body.info.truncate(50).html_safe)
     end
     # column :created_at
    actions name: "Actions"
  end


show do |route|
    attributes_table do  
    row :name
    row "Information" do |body|
        body.try(:info).try(:html_safe)
     end
      row  :image do |img|
        image_tag img.image_url(:homepage_images)
      end
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

   # def create
       
   #       if (var = params[:category][:info].nil?)     
   #         return redirect_to :back, :alert => "Please Fill In The Infomations" if (params[:category][:info].nil?)
   #       # else
   #       #   return redirect_to :back, :alert => "Please Select at least two images for city" if (params[:activity][:photos_attributes].count < 2)
   #            debugger
   #            super do |success,failure|
   #             success.html { redirect_to admin_activities_path ,notice: 'Category  was successfully created.' }
   #             failure.html { redirect_to :back, :alert => "Please fill in the Information" }
   #         end
   #       end  
   #  end
 end
end