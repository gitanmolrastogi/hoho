ActiveAdmin.register Tip do
permit_params :title ,:content
filter :title
filter :content


 index do
    selectable_column
    id_column
    #column :title
    column "Title" do |t|
        t.title.try(:capitalize)
    end
    column "Content" do |body|
     sanitize(truncate(body.try(:content).html_safe, omision: "...", length: 100, :escape => false))
    end
    # column :created_at
    actions name: "Actions"
  end

show :title=> "Admin User Info" do |ad|
    attributes_table do  
    #row  :title
    row "Title" do |t|
        t.title.try(:capitalize)
    end
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

controller do 
    def create
         if (params[:tip][:title].nil?)
           return redirect_to :back, :alert => "Title field is empty" if (params[:tip][:title].nil?)
         else
           return redirect_to :back, :alert => "Content is empty" if (params[:tip][:content].nil?)
             super do |success,failure|
               success.html { redirect_to admin_tips_path ,notice: 'Tip  was successfully created.' }
               failure.html { redirect_to :back, :alert => "Tip was not created successfully." }
             end
         end  
    end
end

end

