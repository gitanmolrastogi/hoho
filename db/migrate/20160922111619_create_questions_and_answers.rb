class CreateQuestionsAndAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_and_answers do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
