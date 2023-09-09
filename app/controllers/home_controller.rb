class HomeController < ApplicationController
  def index
    @questions = Question.all

    @questions = Question.filter(params[:query]) if params[:query].present?

    @questions
  end
end
