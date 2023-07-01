# frozen_string_literal: true

class Api::V1::QuestionsController < Api::V1::BaseController
  before_action :load_question, only: %i[show]
  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    render json: @question, serializer: QuestionWithAdditionsSerializer
  end

  private

  def load_question
    @question = Question.with_attached_files.find(params[:id])
  end
end
