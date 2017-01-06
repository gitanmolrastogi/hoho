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
              l.input :image , as: :file , :hint => l.object.image.present? ? image_tag(l.object.image.url, :width => 200, :height => 200) : "", :input_html=>{required: true}
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

index do |f|
     selectable_column
     column :name  
     column "overview" do |body|
              truncate(body.overview, omision: "...", length: 100)
     end
     column "important" do |body|
              truncate(body.important, omision: "...", length: 100)
     end
     column :created_at
    actions
  end
 
 show do |city|
    attributes_table do  
    row :id
    row :name
    row :overview
    row :important

      row  :image do |img|
        image_tag img.image_url,:width => 100, :height => 100
      end
      row :created_at
      row :updated_at
    end
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