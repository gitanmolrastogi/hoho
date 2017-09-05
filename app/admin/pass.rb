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





collection_action :find_route_type do 
 @route = []
 @route = MainRoute.all.pluck(:name,:name) if params[:category_type] == "Open"
 @route = LineColorRoute.all.pluck(:name,:name) if params[:category_type] == "Closed"

 respond_to do |format|
        format.html 
        format.json  { render :json => {:route=>@route } }
      end

end





end
