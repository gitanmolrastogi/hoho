ActiveAdmin.register LineColorRoute do

filter :name 
filter :price 
filter :duration


permit_params :name , :price , :duration , :image, :zoomed_image,:main_route_id ,city_routes_attributes: [:id, :city_id ,:priority ,:_destroy]


form do  |f|
  f.inputs do
    f.input :main_route_id ,:as => :select, :collection => MainRoute.all.map{|u| ["#{u.name}", u.id]} , :include_blank => false #, input_html: {class: "select_city",id: "select_city_id"}
    f.input :name
      f.inputs "Please select the stops points as their sequences!!" do
          f.has_many :city_routes  do |l|
              l.input :city_id ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", u.id]},:include_blank => true, input_html: {class: "select_city"}
              a = 1..100
              # l.input :priority , :label => 'Sequence Number', :as => :select, :collection => a , input_html: {class: "priority",id: "priority_id"}
              puts "-----------------------------------------------------------------------------"
              if  request.original_url.include?("edit") 
               l.input :_destroy, :as => :boolean, :label => "Delete"
              end
          end
      end
    f.input :price
    f.input :duration ,:label => 'Duration in Days'
    f.input :image, as: :file
    f.input :zoomed_image , as: :file
  end
  actions
end


show :title=> "Route Management" do |route|
    attributes_table do	 
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row  :zoomed_image do |zoomed_image|
      image_tag zoomed_image.zoomed_image_url(:homepage_images)
    end
    row :hops do |route|
      route.cities.pluck(:name).join(", ")
    end
	row :name
	row :price
	row :duration

    # row  :status
   end
end



controller do
  def to_s
    self.name.to_s
  end
end


end





