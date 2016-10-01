ActiveAdmin.register City do
 before_filter :downcase_params
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name , :overview ,:important , photos_attributes: [:id, :image ,:status ,:_destroy]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


form do  |f|
  f.inputs do
    f.input :name
    f.input :overview 
      f.inputs "Please select images for the city." do
          f.has_many :photos  do |l|
              l.input :image , as: :file
              l.input :status ,:as => :select, :collection => [['Active',true],['Inactive',false]] ,:include_blank => false
              l.input :_destroy, :as => :boolean, :label => "Delete"
          end
      end
    f.input :important
end
actions
end

controller do 
   def downcase_params
   	  # p "-----#{params[:city][:name].inspect}---------"
   	  if params[:city].present?
   	  	   p "==========#{params[:city].inspect}======="
   	       params[:city][:name] = params[:city][:name].downcase
      end

  end	

 end
end