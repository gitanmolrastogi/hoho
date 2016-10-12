ActiveAdmin.register City do
before_filter :downcase_city
filter :name
filter :overview
filter :important
permit_params :name , :overview ,:important , photos_attributes: [:id, :image ,:status ,:_destroy]


form do |f|
  f.inputs do
    f.input :name
    f.input :overview 
      f.inputs "Please select images for the city." do
          f.has_many :photos  do |l|
              l.input :image , as: :file
              l.input :status ,:as => :select, :collection => [['Active',true],['Inactive',false]] ,:include_blank => false


               if  request.original_url.include?("edit") 
                    l.input :_destroy, :as => :boolean, :label => "Delete"
               end

          end
      end
    f.input :important
end
actions
end

controller do 
   def downcase_city
   	  if params[:city].present?
   	       params[:city][:name] = params[:city][:name].downcase
      end
   end	
  end
end