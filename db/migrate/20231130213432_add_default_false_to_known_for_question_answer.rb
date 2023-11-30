class AddDefaultFalseToKnownForQuestionAnswer < ActiveRecord::Migration[7.0]
  def change
    change_column_default :question_answers, :known, from: nil, to: false
  end
end
