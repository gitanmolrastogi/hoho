class QuestionsAndAnswer < ApplicationRecord
   #validation starts here...

    validates :question, presence: true
    validates :answer, presence: true

   #validation ends here...
end
