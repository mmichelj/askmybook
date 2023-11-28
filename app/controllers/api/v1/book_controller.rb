class Api::V1::BookController < ApplicationController
  def ask

  end

  def lucky
    
  end

  private

  def book_params
    params.permit(:query)
  end
end
