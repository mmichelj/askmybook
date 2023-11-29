class QuestionAnswer < ApplicationRecord
    before_validation :set_token_count, on: :create
    validates :answer, presence: true
    validates :question_embedding, presence: true
    validates :token_count, presence: true
    
    scope :with_question_embedding, -> { where.not(question_embedding: nil) }
    scope :without_question_embedding, -> { where(question_embedding: nil) }
    has_neighbors :question_embedding

    def nearest
        nearest_neighbors(:question_embedding, distance: :inner_product)
    end

    def set_token_count
        self.token_count = Tiktoken.encoding_for_model("gpt-4").encode(data).length
    end
end
