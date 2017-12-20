ActiveAdmin.register QuestionsAndAnswer , as: "FAQ" do
filter :answer
filter :question
permit_params :question, :answer

    index do |f|
    selectable_column
    column "Question" do |body|
          truncate(body.question, omision: "...", length: 100).capitalize
    end
    column "Answer" do |body|
        sanitize(truncate(body.try(:answer).html_safe, omision: "...", length: 100, :escape => false))
    end
    # column :created_at
    actions name: "Actions"
    end
 
    show do |city|
        attributes_table do  
        row :id
        #row :question
        row "Question" do |q|
            q.question.try(:capitalize)
        end
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

    controller do 

    def create
      
        if (params[:questions_and_answer][:question].blank?)
            return redirect_to :back, :alert => "Please provide question for FAQs" if (params[:questions_and_answer][:question].blank?)
        else
            return redirect_to :back, :alert => "Please provide answer for FAQs" if (params[:questions_and_answer][:answer].blank?)
              super do |success,failure|
                success.html { redirect_to admin_faqs_path ,notice: 'Faqs was successfully created.' }
                failure.html { redirect_to :back, :alert => "Please provide answers for FAQs" }
              end
             

         end  
    end

    def update
            super do |success,failure|
                success.html { redirect_to admin_faqs_path ,notice: 'Faqs was successfully updated.' }
                failure.html { redirect_to :back, :alert => "Faqs was not successfully updated." }
            end
    end

    
  end

end
