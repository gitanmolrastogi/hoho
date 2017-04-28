ActiveAdmin.register QuestionsAndAnswer , as: "FAQ" do
filter :answer
filter :question
permit_params :question, :answer

    index do |f|
    selectable_column
    column "Question" do |body|
          truncate(body.question, omision: "...", length: 100)
    end
    column "Answer" do |body|
        truncate(body.try(:answer).html_safe, omision: "...", length: 100, :escape => false)
    end
    # column :created_at
    actions name: "Actions"
    end
 
    show do |city|
        attributes_table do  
        row :id
        row :question
        row :answer do |resource|
            resource.try(:answer).html_safe
        end 
        # row :created_at
        # row :updated_at
        end
    end

    form :title => "Edit content" do |f|
        f.inputs "#{f.title}" do     
          f.input :question
          f.input :answer, as:  :ckeditor,  :label => "Answer"
        end
        f.actions
    end

end
