ActiveAdmin.register QuestionsAndAnswer , as: "FAQ" do
filter :answer
filter :question
permit_params :question, :answer
end
