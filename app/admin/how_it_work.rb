ActiveAdmin.register HowItWork do
actions :all, :except => [:destroy,:new]
filter :title
permit_params :image, :title,:content,:sub_title,:icon
index do
    selectable_column
    column :title
    column :content
    column :image do |img|
      image_tag img.image_url(:how_it_work_image)
    end
    actions
  end
 
show :title=> "How It Works" do |ad|
    attributes_table do  
    row  :title
    row :content
    row  :image do |img|
      image_tag img.image_url(:how_it_work_image)
    end
   end
end

 form do |f|
    f.inputs "New How It Works" do     
      f.input :image,:as => :file
      f.input :title
      f.input :content ,as: :text 
    end
     f.actions
  end


end
