class AnswerService < ApplicationService

    attr_reader :question

    def initialize(question)
      @question = question
    end

    def call
        # Call openai or db or redis
        call_db
    end

    private

    def call_cache
    end

    def call_db
        # Look for answer in db
        answer = QuestionAnswer.nearest_neighbors(:question_embedding, @question[:embeddings], distance: "euclidean").first
        puts answer.inspect
        answer['answer']
    end

    def call_openai
        # Get relevant book sections
        sections = Book.nearest_neighbors(:embedding, @question[:embeddings], distance: "euclidean").first(3)
        contexts = sections.map { |section| section[:context] }

        # Call Open AI API
        answer = OpenaiService.ask_gpt(contexts.join("</CONTEXT><CONTEXT>"), @question[:text])

        # Save response on db
        QuestionAnswer.create(question: @question[:text], question_embedding: @question[:embeddings], answer: answer)

        answer
    end
end