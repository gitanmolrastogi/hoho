ActiveAdmin.register LineColorRoute do

filter :name 
# filter :price 
filter :duration


permit_params :name , :duration , :image,:image_credit, :zoomed_image,:image_credit_zoomed,:main_route_id ,city_routes_attributes: [:id, :city_id ,:priority ,:_destroy]


form do  |f|
  f.inputs do
    f.input :main_route_id ,:as => :select, :collection => (MainRoute.all.map{|u| ["#{u.name}".capitalize, u.id]}).sort , :include_blank => false #, input_html: {class: "select_city",id: "select_city_id"}
    f.input :name
      f.inputs "Please select the stops points as their sequences!!" do
          f.has_many :city_routes  do |l|
              l.input :city_id ,:as => :select, :collection => (City.all.map{|u| ["#{u.name}".capitalize, u.id]}).sort,:include_blank => true, input_html: {class: "select_city"}
              a = 1..100
              puts "-----------------------------------------------------------------------------"
              if  request.original_url.include?("edit") 
               l.input :_destroy, :as => :boolean, :label => "Delete"
              end
          end
      end
    # f.input :duration ,:label => 'Duration in Days'
    f.input :image, as: :file, label: "Image (preferably 1600 x 900 px)"
    f.input :image_credit
    f.input :zoomed_image , as: :file, label: "Zoomed Image (preferably 1600 x 900 px)"
    f.input :image_credit_zoomed, :label => "Image Credit"
  end
  actions
end

index do
    selectable_column
    #column :name
    column "Name" do |n|
      n.name.capitalize
    end
    column  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    column :image_credit
    column  :zoomed_image do |img|
      image_tag img.zoomed_image_url(:homepage_images)
    end
    column "Image Credit" do |n|
      n.image_credit_zoomed
    end
    # column :created_at
    actions name: "Actions"
  end

show :title=> "Route Management" do |route|
    attributes_table do	
    #0row :name
    row "Name" do |n|
        n.name.try(:capitalize)
    end
    row  :image do |img|
      image_tag img.image_url(:homepage_images)
    end
    row :image_credit
    row  :zoomed_image do |zoomed_image|
      image_tag zoomed_image.zoomed_image_url(:homepage_images)
    end
    row "Image Credit" do |n|
      n.image_credit_zoomed
    end
    row :hops do |route|
      route.cities.pluck(:name).map(&:capitalize).join(", ")
    end
    # row :created_at
    # row :updated_at
    	# row :price
    	# row :duration
   end
end



controller do
  def to_s
    self.name.to_s
  end

  def create
             super do |success,failure|
               success.html { redirect_to  admin_line_color_routes_path ,notice: 'Line color route  was successfully created.' }
               failure.html { redirect_to :back, :alert => "Line color route was not successfully created !!!" }
             end
    end
end


end





