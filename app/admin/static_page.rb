ActiveAdmin.register StaticPage do

permit_params :title, :content, :type
actions :all, :except => [:destroy , :new]
index do |f|
    column :title
    column "Content" do |body|
     truncate(body.try(:content).html_safe, omision: "...", length: 100, :escape => false)
    end
    # column :created_at
 actions name: "Actions"
end


  form :title => "Edit content" do |f|
    f.inputs "#{f.title}" do     
      f.input :title, :label => "Title" ,:input_html => {:placeholder => "Please Enter alphabets only! and length should be 5-30", :disabled => true}
      f.input :content, as:  :ckeditor,  :label => "Description" ,:input_html => {:placeholder => "Add a description min. length should be 30"}

    end
     f.actions
 
  end
 

 show :title=> "Content" do |ad|
    attributes_table do	 
    row  :title 
    row  "Content" do 
    	ad.content.html_safe
    end
    # row  :created_at 
    # row  :updated_at 

   end
end

 

end
