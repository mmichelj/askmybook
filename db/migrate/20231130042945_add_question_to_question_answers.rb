class AddQuestionToQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :question_answers, :question, :string
  end
end
