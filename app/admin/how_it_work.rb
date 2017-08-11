ActiveAdmin.register HowItWork do
actions :all, :except => [:destroy,:new]
filter :title
permit_params :image,:image_credit, :title,:content,:sub_title,:icon
index do
    selectable_column
    #column :title
    column "Title" do |t|
        t.title.try(:capitalize)
    end
    column "Content" do |body|
        truncate(body.try(:content).html_safe, omision: "...", length: 30, :escape => false)
    end
    column :image do |img|
      image_tag img.image_url(:how_it_work_image)
    end
    column :image_credit
    actions name: "Actions"
  end
 
show :title=> "How It Works" do |ad|
    attributes_table do  
    #row  :title
    row "Title" do |t|
        t.title.try(:capitalize)
    end
    row :content do |resource|
      resource.content.html_safe
    end
    row  :image do |img|
      image_tag img.image_url(:how_it_work_image)
    end
    row :image_credit
   end
end

 form do |f|
    f.inputs "New How It Works" do     
      f.input :image,:as => :file
      f.input :image_credit, :input_html => {:maxlength => 100}
      f.input :title
      f.input :content ,as: :ckeditor
    end
     f.actions 
  end


end
