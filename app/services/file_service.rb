class FileService
    FILE_PATH = Rails.root.join('public','pdf_embeddings.csv')

    attr_reader :question_embeddings, :vectors

    def self.call

    end

    def initialize(question_embeddings)
        @question_embeddings = question_embeddings
        @vectors = load_vectors
    end

    private

    def load_vectors
        
    end

end