ActiveAdmin.register City do
before_filter :downcase_city
filter :name
filter :overview
filter :important
permit_params :name , :overview ,:important , :image, photos_attributes: [:id, :image ,:status ,:_destroy]
form do |f|
  f.inputs do
    f.input :name
    f.input :overview 
    f.input :image , as: :file , :hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""

      f.inputs "Please select images for the city." do
          f.has_many :photos  do |l|
              l.input :image , as: :file , :hint => l.object.image.present? ? image_tag(l.object.image.url, :width => 200, :height => 200) : ""
              l.input :status ,:as => :select, :collection => [['Active',true],['Inactive',false]] ,:include_blank => false
               if  request.original_url.include?("edit") 
                    l.input :_destroy, :as => :boolean, :label => "Delete"
               end

          end
      end
    f.input :important
end
actions
end
controller do 
   def downcase_city
   	  if params[:city].present?
   	       params[:city][:name] = params[:city][:name].downcase
      end
   end

       def create
        if (params[:city][:photos_attributes].nil?)
         return redirect_to :back, :alert => "Please Select images for city" if (params[:city][:photos_attributes].nil?)
         else
         return redirect_to :back, :alert => "Please Select at least two images for city" if (params[:city][:photos_attributes].count < 2)
         super do |success,failure|
           success.html { redirect_to admin_cities_path,notice: 'City  was successfully created.' }
           failure.html { redirect_to :back, :alert => "Please Select at least two images for city" }
         end
       end	
       end
  end
end