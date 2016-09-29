ActiveAdmin.register City do
 before_filter :downcase_params
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name , :overview ,:important
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

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