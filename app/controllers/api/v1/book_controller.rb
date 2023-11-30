class Api::V1::BookController < ApplicationController
  include ActionController::Live

  def ask
    response = {}
    question_embeddings = OpenaiService.calculate_embeddings(params[:question])
    bookres = Book.nearest_neighbors(:embedding, question_embeddings, distance: "euclidean").first(3)
    bookres = bookres.map { |item| item[:context] }
    chatres = OpenaiService.ask_gpt(bookres.join(separator = "</CONTEXT><CONTEXT>"), params[:question])
    
    render json: chatres
  end

  def lucky
    response = {}
    response['question'] = 'The question?'
    response['answer'] = 'This is the lucky answer'
    render json: response.to_h
  end

  private

  def book_params
    params.permit(:question)
  end
end
