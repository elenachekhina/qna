require 'rails_helper'

RSpec.describe AnswersController, type: :request do
  let(:question) { create(:question) }

  describe 'GET #new' do
    before { get new_question_answer_path(question) }

    it 'assign question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'assigns a new Answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new question`s answer in the database' do
        expect { post question_answers_path(question, params: { answer: attributes_for(:answer) }) }.to change(question.answers, :count).by(1)
      end

      it 'redirect to question show view' do
        post question_answers_path(question, params: { answer: attributes_for(:answer) })
        expect(response).to redirect_to assigns(:question)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the question' do
        expect { post question_answers_path(question, params: { answer: attributes_for(:answer, :invalid) }) }.to_not change(question.answers, :count)
      end
      it 're-render new view' do
        post question_answers_path(question, params: { answer: attributes_for(:answer, :invalid) })
        expect(response).to render_template :new
      end
    end
  end
end
