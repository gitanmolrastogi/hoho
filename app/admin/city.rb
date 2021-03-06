ActiveAdmin.register City do
before_filter :downcase_city
filter :name
filter :overview
filter :important
permit_params :name , :overview ,:important , :image,:image_credit, photos_attributes: [:id, :image, :image_credit ,:status ,:_destroy]
form do |f|
  f.inputs do
    f.input :name
    f.input :overview ,as: :ckeditor
    f.input :image , as: :file , :hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : "", label: "Image (preferable 1600 x 900 px)"
    f.input :image_credit, :input_html => {:maxlength => 100}
      f.inputs "Please select atleast 2 images for the city." do
          f.has_many :photos  do |l|
              l.input :image , as: :file , :hint => l.object.image.present? ? image_tag(l.object.image.url, :width => 200, :height => 200) : ""
              l.input :image_credit
              l.input :status ,:as => :select, :collection => [['Active',true],['Inactive',false]] ,:include_blank => false
               if request.original_url.include?("edit") 
                    l.input :_destroy, :as => :boolean, :label => "Delete"
               end
          end
      end

    f.input :important,as: :ckeditor, :label => "Information"
    f.actions
end

end

index do |f|
     selectable_column
     column "Name" do |n|
        #n.name.try(:capitalize)
        n.name.try(:titleize)
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
     column "Information" do |body|
         sanitize(truncate(body.try(:important).html_safe, omision: "...", length: 100, :escape => false))
     end
    actions name: "Actions"
end
 
show do |city|
    attributes_table do  
    row :id
    row "Name" do |n|
      n.name.try(:titleize)
    end
    row "Overview" do |body|
       body.try(:overview).html_safe
     end
    row "Information" do |body|
      body.try(:important).html_safe
    end
      row  :image do |img|
        image_tag img.image_url,:width => 100, :height => 100
      end
    row :image_credit  
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
               success.html { redirect_to admin_cities_path,notice: 'City was successfully created.' }
               failure.html { redirect_to :back, :alert => "Please Select images for city" }
            end
        end	
      end

      def update
            super do |success,failure|
             success.html { redirect_to admin_cities_path,notice: 'City was successfully updated.' }
             failure.html { redirect_to :back, :alert => "City was not successfully updated." }
            end
      end
  end
 end  
