class Api::V1::BookController < ApplicationController
  include ActionController::Live

  def ask
    question = { text: params[:question], embeddings: [] }
    # Calculate question embeddings
    question[:embeddings] = OpenaiService.calculate_embeddings(question[:text])
    # Get answer from cache, db or api
    answer = AnswerService.call(question)
    render json: answer
  end

  def lucky
    question_answer = { question: '', answer: '' }
    
    result = QuestionAnswer.columns

    puts result.inspect

    render json: result.to_h
  end

  private

  def book_params
    params.permit(:question)
  end
end
