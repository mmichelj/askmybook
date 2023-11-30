class AnswerService < ApplicationService

    attr_reader :question

    def initialize(question)
      @question = question
    end

    def call
        # Call openai or cache or db
        answer = call_cache
        
        if answer[:distance] > 0.5 then
            answer = call_db
        end

        if answer[:distance] > 0.5 then
            answer = call_openai
        end

        answer[:text]
    end

    private

    def call_cache

        { text: '', distance: 1}
    end

    def call_db
        # Look for answer in db
        result = QuestionAnswer.nearest_neighbors(:question_embedding, @question[:embeddings], distance: "euclidean").first
        
        { text: result['answer'], distance: result.neighbor_distance }
    end

    def call_openai
        # Get relevant book sections
        sections = Book.nearest_neighbors(:embedding, @question[:embeddings], distance: "euclidean").first(3)
        contexts = sections.map { |section| section[:context] }

        # Call Open AI API
        result = OpenaiService.ask_gpt(contexts.join("</CONTEXT><CONTEXT>"), @question[:text])

        # Save response on db
        QuestionAnswer.create(question: @question[:text], question_embedding: @question[:embeddings], answer: result)

        { text: result, distance: 0.0}
    end
end