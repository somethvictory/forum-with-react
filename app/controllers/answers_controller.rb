class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(user: current_user, body: answer_params[:body])

    if @answer.save
      redirect_to question_path(@question, answer_id: @answer.id)
    else
      render 'questions/show'
    end
  end

  def edit
    @question = current_user.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    render :new
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.find(params[:id])

    if @answer.update(answer_params)
      redirect_to question_path(@question, answer_id: @answer.id)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
