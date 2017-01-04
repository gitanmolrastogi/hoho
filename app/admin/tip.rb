ActiveAdmin.register Tip do
permit_params :title ,:content
filter :title
filter :content


 index do
    selectable_column
    id_column
    column :title
    column "Content" do |body|
              truncate(body.content, omision: "...", length: 100)
     end
    column :created_at
    actions
  end

show :title=> "Admin User Info" do |ad|
    attributes_table do  
    row  :title
    row  :content
    row  :created_at
    row  :updated_at
   end
end
end

