class AddKnownToQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :question_answers, :known, :boolean
  end
end
