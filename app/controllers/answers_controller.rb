class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :load_question, only: %i[new create]
  before_action :load_answer, only: %i[destroy]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)
    respond_to do |format|
      format.html do
        if @answer.save
          redirect_to @question, notice: 'Your answer successfully created.'
        else
          @new_answer = @answer
          render 'questions/show'
        end
      end
      format.turbo_stream do
        if @answer.save
          @new_answer = @question.answers.new
          flash[:notice] = "Your answer successfully created."
          render
        else
          @new_answer = @answer
          render
        end
      end
    end
  end

  def destroy
    if current_user.author_of? @answer
      @question = @answer.question
      @answer.destroy
      respond_to do |format|
        format.html do
          redirect_to @question, notice: 'Answer was successfully deleted'
        end
        format.turbo_stream do
          flash[:notice] = 'Answer was successfully deleted'
          render
        end
      end

    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body).merge(author: current_user)
  end
end
