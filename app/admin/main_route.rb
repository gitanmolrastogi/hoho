ActiveAdmin.register MainRoute do


filter :name
filter :start_point
filter :end_point
filter :price
filter :duration

actions :all, :except => [:edit,:destroy]

permit_params :information , :start_point ,:end_point , :name , :image ,:image_credit, :price , :duration
form do |f|
	f.inputs do

		f.input :name
	  f.input :information,input_html: {id: "inp_info"},as: :ckeditor
		f.input :price#,as: :string
		f.input :duration
		# f.input :image , :hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""


    f.input :start_point ,:as => :select, :collection => (City.all.map{|u| ["#{u.name}".capitalize, "#{u.name}".capitalize]}).sort,include_blank: false, include_hidden: false#, input_html: {class: "select_city",id: "select_city_id"}
    f.input :end_point, :as => :select ,:collection => (City.all.map{|u| ["#{u.name}".capitalize, "#{u.name}".capitalize]}).sort,include_blank: false, include_hidden: false# input_html: {:disabled => true }, :collection =>  {}, :include_blank => false
    f.input :image ,label: "Image (preferably 1600 x 900 px)",:hint => f.object.image.present? ? image_tag(f.object.image.url, :id=> 'my_image1') : (
      div :class=> "Pictures_Pannel" do 
        image_tag("no_image.png", :id=> 'my_image')
      end
    )
    f.input :image_credit, input_html: {maxlength: 100}	

  end
	actions
end

index do
    selectable_column
    column :id
    #column :name
    column "Name" do |n|
       n.name.try(:capitalize)
    end
    column :price
    column :duration
    column :start_point
    column :end_point
    column :information do |body|
     sanitize(truncate(body.try(:information).html_safe, omision: "...", length: 100, :escape => false))
    end
    column  :image do |img|
      image_tag img.image_url,:width => 100, :height => 100
    end
    column :image_credit
    # column :created_at
    #actions name: "Actions"

    column 'Status' do |resource|
      if (resource.is_active == true)
        '<i class = "status_tag yes"> Available </i>'.html_safe
      else
        '<i class = "status_tag no"> Blocked </i>'.html_safe
      end
    end


   





    actions name: "Actions" do |ff|
      
      
      a do 
        if (ff.is_active == true)
          link_to 'Block' , block_main_routes_admin_main_routes_path(id: ff.id),
              data: { confirm: 'Are you sure?' }
        else
          link_to 'Unblock' , block_main_routes_admin_main_routes_path(id: ff.id),
              data: { confirm: 'Are you sure?' }
        end
      end
      
     end


  end


collection_action :block_main_routes, method: :get do
         main_route = MainRoute.find(params[:id]) 
         if (main_route.is_active == true)


          main_route.update_attributes(:is_active => false)
          
          main_route.line_color_routes.update_all(:is_active => false)



          redirect_to  :back
        else
          main_route.update_attributes(:is_active => true)
          redirect_to  :back
        end
     end








show :title=> "Main Route " do |route|
      attributes_table do	
        row :id
        #row :name
        row "Name" do |n|
            n.name.try(:capitalize)
        end
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
        row :image_credit
      # row :created_at
      # row :updated_at
      	# row :price
      	# row :duration
     end
  end

  controller do 
    def create
             super do |success,failure|
               success.html { redirect_to admin_main_routes_path ,notice: 'City  was successfully created.' }
               failure.html { redirect_to :back, :alert => "Please Select at least two images for city" }
             end
         
    end
  end

  

end





