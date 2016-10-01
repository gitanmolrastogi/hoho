ActiveAdmin.register Category do
before_filter :downcase_category
filter :name
permit_params :name, :image

form do  |f|
  f.inputs do
    f.input :name,:input_html=>{:disabled=>true} if params[:action]=="edit"
    f.input :name  if params[:action]=="new"
    f.input :image, as:  :file

  end
  actions
end

controller do 
   def downcase_category
   	   p "====#{params[:category].inspect}=="
   	  if params[:category].present?
   	       params[:category][:name] = params[:category][:name].downcase
      end
   end	
  end
end
