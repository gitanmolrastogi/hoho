ActiveAdmin.register Activity do

filter :name
filter :overview
filter :information
permit_params :start_date ,:end_date ,:start_time,:end_time ,:price,:name ,:overview ,:information ,:city_id, :category_id , :image , photos_attributes: [:id, :image ,:status ,:_destroy]

index do |f|
     selectable_column
     column :name
     column :overview
     column :information
     column :start_date
     column :end_date
     column :start_time do |time|
         time.try(:start_time).strftime("%H:%M")
     end
    column :end_time do |time|
         time.try(:end_time).strftime("%H:%M")
    end
    column :price
    actions
  end

show :title=> "Activity Details" do |activity|
    attributes_table do  
      row :name
      row :overview
      row :information
      row :start_date
      row :end_date
      row  :image do |img|
        image_tag img.image_url(:photos)
      end
      
      row "start_time" do |activity|
        activity.start_time.strftime("%H:%M")
      end 
       row "end_time" do |activity|
        activity.end_time.strftime("%H:%M")
      end 
      row :price
      end

    # row  :status
   end









form do |f|
  f.inputs do
  	f.input :city ,:as => :select, :collection => City.all.map{|u| ["#{u.name}", u.id]}
    f.input :category ,:as => :select, :collection => Category.all.map{|u| ["#{u.name}", u.id]}
  	f.input :name
  	f.input :overview
  	f.input :information
    f.inputs "Please select images for the city." do
          f.has_many :photos  do |l|
              l.input :image , as: :file , :hint => l.object.image.present? ? image_tag(l.object.image.url, :width => 200, :height => 200) : ""
              l.input :status ,:as => :select, :collection => [['Active',true],['Inactive',false]] ,:include_blank => false
               if  request.original_url.include?("edit") 
                    l.input :_destroy, :as => :boolean, :label => "Delete"
               end

          end
      end
    f.input :start_date,as: :datepicker
    f.input :end_date,as: :datepicker
    f.input :start_time
    f.input :end_time 
    f.input :image, :hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""
    f.input :price 
  end
  actions
end



 controller do 
    # def create
    #      if (params[:activity][:photos_attributes].nil?)
    #        return redirect_to :back, :alert => "Please Select images for activity" if (params[:activity][:photos_attributes].nil?)
    #      else
    #        return redirect_to :back, :alert => "Please Select at least two images for city" if (params[:activity][:photos_attributes].count < 2)
    #          super do |success,failure|
    #            success.html { redirect_to admin_activities_path ,notice: 'City  was successfully created.' }
    #            failure.html { redirect_to :back, :alert => "Please Select at least two images for city" }
    #          end
    #      end  
    # end
  end
end
