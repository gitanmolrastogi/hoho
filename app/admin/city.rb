ActiveAdmin.register City do
before_filter :downcase_city
filter :name
filter :overview
filter :important
permit_params :name , :overview ,:important , :image, photos_attributes: [:id, :image ,:status ,:_destroy]
form do |f|
  f.inputs do
    f.input :name
    f.input :overview ,as: :ckeditor
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
    f.input :important,as: :ckeditor
end
actions
end

index do |f|
     selectable_column
     column "Name" do |n|
        n.name.try(:capitalize)
     end 
     # column "Overview" do |body|
     #    truncate(body.try(:overview).html_safe, omision: "...", length: 150, :escape => false)
     #    #truncate(body.try(:overview), omision: "...", length: 100)
     # end
     # column "Important" do |body|
     #    truncate(body.try(:important).html_safe, omision: "...", length: 100, :escape => false)
     # end
     # column :created_at
     column "Overview" do |body|
         sanitize(truncate(body.try(:overview).html_safe, omision: "...", length: 100, :escape => false))
     end
     column "Important" do |body|
         sanitize(truncate(body.try(:important).html_safe, omision: "...", length: 100, :escape => false))
     end
    actions name: "Actions"
end
 
show do |city|
    attributes_table do  
    row :id
    row "Name" do |n|
      n.name.try(:capitalize)
    end
    row "Overview" do |body|
       body.try(:overview).html_safe
     end
    row "Important" do |body|
      body.try(:important).html_safe
    end
      row  :image do |img|
        image_tag img.image_url,:width => 100, :height => 100
      end
      # row :created_at
      # row :updated_at
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
           failure.html { redirect_to :back, :alert => "Please Select images for city" }
         end
       end	
       end
  end
 end  