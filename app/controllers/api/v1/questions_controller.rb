# frozen_string_literal: true

class Api::V1::QuestionsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :load_question, only: %i[show update destroy]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    render json: @question, serializer: QuestionWithAdditionsSerializer
  end
  
  def create
    @question = current_resource_owner.questions.new(question_params)
    authorize @question

    if @question.save
      render json: @question
    else
      render json: {'errors': @question.errors}
    end
  end

  def update
    authorize @question

    if @question.update(question_params)
      render json: @question
    else
      render json: {'errors': @question.errors}
    end
  end

  def destroy
    authorize @question

    @question.destroy
    render json: 'Question was successfully deleted'
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, links_attributes: %i[id name url _destroy],
                                                    reward_attributes: %i[id name file _destroy])
  end



  def user_not_authorized
    render json: { error: "You are not authorized to perform this action." }, status: 403
  end

  def record_not_found
    render json: { error: "Record not found." }, status: 403
  end
end
