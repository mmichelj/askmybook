class Book < ApplicationRecord
    before_validation :set_token_count, on: :create
    
    validates :context, presence: true
    validates :embedding, presence: true
    validates :token_count, presence: true

    has_neighbors :embedding

    def set_token_count
        self.token_count = Tiktoken.encoding_for_model("gpt-4").encode(context).length
    end
end
