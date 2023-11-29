class Api::V1::BookController < ApplicationController
  include ActionController::Live

  def ask
    response = {}
    question_embeddings = OpenaiService.calculate_embeddings(params[:question])
    render json: response.to_h
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
