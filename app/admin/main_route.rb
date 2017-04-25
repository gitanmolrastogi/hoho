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
		f.input :image , :hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""
	    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}, input_html: {class: "select_city",id: "select_city_id"}
	    f.input :end_point, :as => :select , input_html: {:disabled => true }, :collection =>  {}, :include_blank => false
	end
	actions
 end

index do
    selectable_column
    column :id
    column :name
    column :information
    column :price
    column :duration
    column :start_point
    column :end_point

    column  :image do |img|
      image_tag img.image_url,:width => 100, :height => 100
    end
     
    column :created_at
    actions name: "Actions"
  end

show :title=> "Main Route " do |route|
    attributes_table do	
      row :id
      row :name
      row :information
      row :price
      row :duration
      row :start_point
      row :end_point
    row  :image do |img|
      image_tag img.image_url,:width => 100, :height => 100
    end
    
    row :created_at
    row :updated_at
    	# row :price
    	# row :duration
   end
end

end
