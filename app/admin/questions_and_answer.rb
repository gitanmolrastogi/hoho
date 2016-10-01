ActiveAdmin.register QuestionsAndAnswer , as: "FAQ" do
	filter :question
	filter :answer
    permit_params :question, :answer

end
