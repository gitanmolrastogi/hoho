ActiveAdmin.register Pass do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :name
filter :category
filter :route_name
filter :max_hops
filter :validity
filter :price


permit_params :name, :category,:route_name,:max_hops,:validity,:price


form do |f|
  f.inputs do
  	f.input :name
    f.input :category ,:as => :select, :collection => (["Closed","Open"]).sort,include_blank: false
    f.input :route_name ,:as => :select, :collection => ([]),include_blank: false
    f.input :max_hops
    f.input :validity
  	f.input :price
  end
  actions
end


actions :all, :except => [:edit,:destroy]

index do |f|
    column :id  
    column :name
    column :category
    column :route_name
    column :max_hops
    column :validity
    column :price
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
          link_to 'Block' , block_pass_admin_passes_path(id: ff.id),
              data: { confirm: 'Are you sure you want to Block?' }
        else
          link_to 'Unblock' , block_pass_admin_passes_path(id: ff.id),
              data: { confirm: 'Are you sure you want to Unblock?' }
        end
      end
      a do
       if !Order.where(orderable_type: "Pass", orderable_id: ff.id).present?
        link_to 'Delete', destroy_pass_admin_passes_path(id: ff),method: :delete,data: { confirm: 'Are you sure you to Delete?' }
      end
      end
     end
    #actions name: "Actions"

end





collection_action :destroy_pass, method: :delete do

    if !Order.where(orderable_type: "Pass", orderable_id: params[:id]).present?
      pass = Pass.find_by(id: params[:id])

      if pass && pass.destroy();
         redirect_to :back
         flash[:notice] = "Pass successfully deleted."
      else
         redirect_to :back
         flash[:error] = "Unable to delete pass. Please try again"
      end
    else
         redirect_to :back
         flash[:error] = "Unable to delete pass. User has already added to cart or has bought the pass."
    end

end


collection_action :block_pass, method: :get do
         pass = Pass.find(params[:id]) 
         if (pass.is_active == true)
          pass.update_attributes(:is_active => false)
          redirect_to  :back
        else
          pass.update_attributes(:is_active => true)
          redirect_to  :back
        end
     end


collection_action :find_route_type do 
 @route = []
 @route = MainRoute.where(is_active: true).pluck(:name).map{|k| k.titleize } if params[:category_type] == "Open"
 @route = LineColorRoute.where(is_active: true).pluck(:name).map{|k| k.titleize } if params[:category_type] == "Closed"



 respond_to do |format|
        format.html 
        format.json  { render :json => {:route=>@route } }
      end
end


controller do 
    def create
         super do |success,failure|
               success.html { redirect_to admin_passes_path ,notice: 'Pass  was successfully created.' }
               failure.html { 

                    if resource.errors.any?
                       redirect_to :back, :alert => "Name has to be unique." 
                    else
                       redirect_to :back, :alert => "Oops! Something went wrong." 
                    end


              }
             end
         end  
    end

    



end
