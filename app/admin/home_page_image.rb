ActiveAdmin.register HomePageImage do
batch_action :destroy do |ids|
  images = HomePageImage.where(id: ids)
  if HomePageImage.count == images.count
     redirect_to :back , :alert => "You can't delete all images"
     elsif HomePageImage.count <= 2 
       redirect_to :back , :alert => "You can't delete last two images"
      elsif (HomePageImage.count-images.count) < 2
      redirect_to :back , :alert => "You can't delete last two images"
      elsif HomePageImage.where(status: "Active").count <= 2 && images.pluck(:status).include?('Active')
      redirect_to :back , :alert => "You can't delete last two active images"
      else
       images.destroy_all
       redirect_to admin_home_page_images_path,:alert=>"Images deleted successfully"   
    end
  end

filter :status
permit_params :image,:image_credit, :status
index do
    selectable_column
    column :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    column :image_credit
    column :status
    # column :created_at
    # column :updated_at
    actions name: "Actions"
  end
 
show :title=> "Image" do |ad|
    attributes_table do  
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row :image_credit
    row  :status
    # row :created_at
    # row :updated_at
   end
end

 form do |f|
    f.inputs "New Home Page Image" do     
      f.input :image,:as => :file
      f.input :status ,:as => :select, :collection => ['Active','Inactive'] ,:include_blank => false
      f.input :image_credit, :input_html => {:maxlength => 100}
    end
     f.actions
  end

controller do 
 def create
 
    if (params[:home_page_image][:image].blank?)
                  return redirect_to :back, :alert => "Please select Home Page Image" if (params[:home_page_image][:image].blank?)
    else
            
              super do |success,failure|
                success.html { redirect_to admin_home_page_images_path ,notice: 'Home Page Image  was successfully created.' }
                failure.html { redirect_to :back, :alert => "Please select Home Page Image" }
              end
             

    end  
 end

 def destroy
    if HomePageImage.where(status: "Active").count <= 2 && HomePageImage.find_by(id: params[:id]).try(:status) == "Active"
         redirect_to :back , :alert => "You can't delete last two active images"
     elsif HomePageImage.count <= 2 
       redirect_to :back , :alert => "You can't delete last two images"
     else
      super
    end 
   end
 def update
   p "==========#{params.inspect}============"
    if HomePageImage.count <= 2 && params[:home_page_image][:status] == "Inactive"
      redirect_to :back , :alert => "You can't inactive last two images"
     elsif  HomePageImage.where(status: "Active").count <= 2 && params[:home_page_image][:status] == "Inactive"
       redirect_to :back , :alert => "You can't inactive all images"
     else
      super
    end
   end
   end
 end



