ActiveAdmin.register MainRoute do

permit_params :information , :start_point ,:end_point , :name , :image , :price
form do |f|
	f.inputs do
		f.input :name
	    f.input :information
		f.input :price
		f.input :image
	    f.input :start_point ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", "#{u.name}"]}, input_html: {class: "select_city",id: "select_city_id"}
	    f.input :end_point, :as => :select , input_html: {:disabled => true }, :collection =>  {}, :include_blank => false
	end
	actions
 end
end
