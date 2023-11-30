class Book < ApplicationRecord
    before_validation :set_token_count, on: :create
    validates :context, presence: true
    validates :embedding, presence: true
    validates :token_count, presence: true
    
    scope :with_embedding, -> { where.not(embedding: nil) }
    scope :without_embedding, -> { where(embedding: nil) }

    has_neighbors :embedding

    def nearest
        nearest_neighbors(:embedding, distance: :inner_product)
    end

    def set_token_count
        self.token_count = Tiktoken.encoding_for_model("gpt-4").encode(context).length
    end
end
