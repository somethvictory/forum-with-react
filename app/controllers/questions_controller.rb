class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to root_path, question_id: @question.id
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])

    @answer = @question.answers.new
  end

  def edit
    @question = current_user.questions.find(params[:id])

    render :new
  end

  def update
    @question = current_user.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to root_path, question_id: @question.id
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
