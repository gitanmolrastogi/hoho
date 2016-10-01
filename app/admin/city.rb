ActiveAdmin.register City do
before_filter :downcase_city
permit_params :name , :overview ,:important
filter :name

form do  |f|
  f.inputs do
    f.input :name,:input_html=>{:disabled=>true} if params[:action]=="edit"
    f.input :name  if params[:action]=="new"
    f.input :overview, as:  :ckeditor
    f.input :important, as:  :ckeditor

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