ActiveAdmin.register Tip do
permit_params :title ,:content
filter :title
filter :content


 index do
    selectable_column
    id_column
    column :title
    column "Content" do |body|
     truncate(body.try(:content).html_safe, omision: "...", length: 100, :escape => false)
    end
    # column :created_at
    actions name: "Actions"
  end

show :title=> "Admin User Info" do |ad|
    attributes_table do  
    row  :title
    row  :content do |resource|
      resource.try(:content).html_safe
    end
    # row  :created_at
    # row  :updated_at
   end
end

form do |f|
  f.inputs "#{f.title}" do     
    f.input :title, :label => "Title" 
    f.input :content, as:  :ckeditor
  end
  f.actions
end


end

