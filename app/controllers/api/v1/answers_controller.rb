# frozen_string_literal: true

class Api::V1::AnswersController < Api::V1::BaseController
  before_action :load_question, only: %i[index]
  before_action :load_answer, only: %i[show]

  def index
    @answers = @question.answers
    render json: @answers
  end

  def show
    render json: @answer, serializer: AnswerWithAdditionsSerializer
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end
end
