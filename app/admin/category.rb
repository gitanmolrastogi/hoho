ActiveAdmin.register Category do

before_filter :downcase_category
filter :name
permit_params :name, :image, :info

form do  |f|
  f.inputs do
    # f.input :name #,:input_html=>{:disabled=>true} if params[:action]=="edit"
    f.input :name # if params[:action]=="new"
    f.input :info
    f.input :image, as:  :file
  end
  actions
end

index do |f|
     selectable_column
     column :name  
     column "Information" do |body|
              truncate(body.info, omision: "...", length: 100)
     end
     column :created_at
    actions
  end


show do |route|
    attributes_table do  
    row :name
    row :info
      row  :image do |img|
        image_tag img.image_url(:homepage_images)
      end
      row :created_at
      row :updated_at
    end
end

controller do 
   def downcase_category
   	   p "====#{params[:category].inspect}=="
   	  if params[:category].present?
   	       params[:category][:name] = params[:category][:name].downcase
      end
   end	
  end
end