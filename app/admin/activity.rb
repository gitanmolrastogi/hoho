ActiveAdmin.register Activity do

filter :name
filter :overview
filter :information
permit_params :start_date ,:end_date ,:start_time,:end_time ,:price,:name ,:overview ,:information ,:city_id, :category_id , :image, :image_credit , photos_attributes: [:id, :image ,:image_credit, :status ,:_destroy]

index do |f|
     selectable_column
     #column :name
      column "Name" do |resource|
          resource.name.try(:titleize)
      end
      column "Overview" do |resource|

       sanitize(truncate(resource.try(:overview).html_safe, omision: "...", length: 200, :escape => false))
      
      end
      column "Category" do |resource|
         resource.try(:category)
      end
      # column "Information" do |resource|
      #   truncate(resource.try(:information).html_safe, omision: "...", length: 100, :escape => false)
      # end
     column :start_date
     column :end_date
     column :start_time do |time|
        time.start_time.present? ? time.start_time.strftime("%I:%M %p") : "00:00"
     end
    column :end_time do |time|
        time.end_time.present? ? time.end_time.strftime("%I:%M %p") : "00:00"
    end
    column :price,as: :string
    actions name: "Actions"
  end

show :title=> "Activity Details" do |activity|
    attributes_table do  
      #row :name
      row "Name" do |resource|
          resource.name.try(:titleize)
      end
      row :overview do |resource|
         resource.overview.html_safe
      end
      row :category do |resource|
         resource.try(:category)
      end
      row :information do |resource|
         resource.information.html_safe
      end
      row :start_date
      row :end_date
      row  :image do |img|
        image_tag img.image_url(:photos)
      end
      row :image_credit
      row "start_time" do |activity|
        activity.try(:start_time).strftime("%I:%M %p")
      end 
       row "end_time" do |activity|
        activity.try(:end_time).strftime("%I:%M %p")
      end 
      row :price
      end

    # row  :status
   end









form do |f|
  f.inputs do
  	f.input :city ,:as => :select, :collection => (City.all.map{|u| ["#{u.name}".titleize, u.id]}).sort, include_blank: false, include_hidden: false
    f.input :category ,:as => :select, :collection => (Category.all.map{|u| ["#{u.name}".capitalize, u.id]}).sort,include_blank: false, include_hidden: false
  	f.input :name, :input_html => {:maxlength => 100}
  	f.input :overview, :as => :ckeditor
  	f.input :information, :as => :ckeditor
    f.inputs "Please select atleast 2 images for the city." do
          f.has_many :photos  do |l|
              l.input :image , as: :file , :hint => l.object.image.present? ? image_tag(l.object.image.url, :width => 200, :height => 200) : "",:input_html=>{:required=> false,:accept=>"Image/*"}
              l.input :image_credit
              l.input :status ,:as => :select, :collection => [['Active',true],['Inactive',false]] ,:include_blank => false

               if  request.original_url.include?("edit") 
                    l.input :_destroy, :as => :boolean, :label => "Delete"
               end

          end
      end
    f.input :start_date,as: :datepicker,input_html: { required: true },include_blank: false, include_hidden: false
    f.input :end_date,as: :datepicker,input_html: { required: true },include_blank: false, include_hidden: false
    f.input :start_time, :ampm=> true, prompt: {hour: "Choose   Hour", minute: 'Choose minute'},input_html: { required: true },include_blank: false, include_hidden: false
    f.input :end_time, :ampm=> true , prompt: {hour: "Choose   Hour", minute: 'Choose minute'},input_html: { required: true },include_blank: false, include_hidden: false
    f.input :image, label: "Image (preferably 1200x900 px)" ,:hint => f.object.image.present? ? image_tag(f.object.image.url, :width => 200, :height => 200) : ""
    f.input :image_credit, :input_html => {:maxlength => 100}
    f.input :price,as: :string
  end
  actions
end



 controller do 
    def create
         if (params[:activity][:photos_attributes].nil?)
           return redirect_to :back, :alert => "Please Select images for activity" if (params[:activity][:photos_attributes].nil?)
         else
           return redirect_to :back, :alert => "Please Select at least two images for city" if (params[:activity][:photos_attributes].count < 2)
             super do |success,failure|
               success.html { redirect_to admin_activities_path ,notice: 'Activity is successfully created.' }
               failure.html { redirect_to :back, :alert => "Please Select at least two images for city" }
             end
         end  
    end

    def update
      super do |success,failure|
               success.html { redirect_to admin_activities_path ,notice: 'Activity is successfully updated.' }
               failure.html { redirect_to :back, :alert => "Activity is not updated successfully." }
      end
    end

    
  end
end
