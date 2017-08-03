ActiveAdmin.register MainRoute do


filter :name
filter :start_point
filter :end_point
filter :price
filter :duration


permit_params :information , :start_point ,:end_point , :name , :image , :price , :duration
form do |f|
	f.inputs do
		f.input :name
	  f.input :information,as: :ckeditor
		f.input :price#,as: :string
		f.input :duration
		# f.input :image , :hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""

    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}".capitalize, "#{u.name}".capitalize]}, input_html: {class: "select_city",id: "select_city_id"}
    f.input :end_point, :as => :select , input_html: {:disabled => true }, :collection =>  {}, :include_blank => false
    f.input :image ,:hint => f.object.image.present? ? image_tag(f.object.image.url, :id=> 'my_image1') : (
      div :class=> "Pictures_Pannel" do 
        image_tag("no_image.png", :id=> 'my_image')
      end
    )	
  end
	actions
 end

index do
    selectable_column
    column :id
    column :name
    column :price
    column :duration
    column :start_point
    column :end_point
    column :information do |body|
     truncate(body.try(:information).html_safe, omision: "...", length: 100, :escape => false)
    end
    column  :image do |img|
      image_tag img.image_url,:width => 100, :height => 100
    end
     
    # column :created_at
    actions name: "Actions"
  end

  show :title=> "Main Route " do |route|
      attributes_table do	
        row :id
        row :name
        row :information do |resource|
          resource.try(:information).html_safe
        end
        row :price
        row :duration
        row :start_point
        row :end_point
      row  :image do |img|
        image_tag img.image_url,:width => 100, :height => 100
      end
      
      # row :created_at
      # row :updated_at
      	# row :price
      	# row :duration
     end
  end

  # controller do 
  #   def create
  #        if (params[:a][:photos_attributes].nil?)
  #          return redirect_to :back, :alert => "Please Select images for activity" if (params[:activity][:photos_attributes].nil?)
  #        else
  #          return redirect_to :back, :alert => "Please Select at least two images for city" if (params[:activity][:photos_attributes].count < 2)
  #            super do |success,failure|
  #              success.html { redirect_to admin_activities_path ,notice: 'City  was successfully created.' }
  #              failure.html { redirect_to :back, :alert => "Please Select at least two images for city" }
  #            end
  #        end  

         
  #   end

    
  # end

end





