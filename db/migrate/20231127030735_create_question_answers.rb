class CreateQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :question_answers, id: :uuid do |t|
      t.timestamps null: false, default: -> { 'NOW()' }, index: true

      t.boolean :known, default: false
      t.string :answer, null: false
      t.vector :question_embedding, dimensions: 1536, using: :ivfflat, opclass: :vector_ip_ops
      t.integer :token_count, null: false
    end
  end
end
