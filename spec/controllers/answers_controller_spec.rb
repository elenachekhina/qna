require 'rails_helper'

RSpec.describe AnswersController, type: :request do
  let(:user) { create(:user) }
  let(:question) { create(:question, author: user) }

  describe 'GET #new' do
    before { get question_path(question) }

    it 'assign question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'assigns a new Answer to @new_answer' do
      expect(assigns(:new_answer)).to be_a_new(Answer).with(question_id: question.id)
    end

    it 'renders answers/_new view' do
      expect(response).to render_template 'answers/_new'
    end
  end

  describe 'POST #create' do
    before { sign_in(user) }

    context 'with valid attributes' do
      it 'saves a new question`s answer in the database' do
        expect{ post question_answers_path(question, params: { answer: attributes_for(:answer) }) }.to change(question.answers, :count).by(1)
                                                                                                   .and change(user.answers, :count).by(1)
      end

      it 'redirect to question show view' do
        post question_answers_path(question, params: { answer: attributes_for(:answer) })
        expect(response).to redirect_to question_path(question)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the question' do
        expect{ post question_answers_path(question, params: { answer: attributes_for(:answer, :answer_invalid) }) }.to change(question.answers, :count).by(0)
                                                                                                                    .and change(user.answers, :count).by(0)
      end
      it 're-render new view' do
        post question_answers_path(question, params: { answer: attributes_for(:answer, :answer_invalid) })
        expect(response).to render_template 'answers/_new'
      end
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in(user) }
    let!(:answer) { create(:answer, question: question, author: user) }

    it 'delete answer from database' do
      expect { delete answer_path(answer) }.to change(question.answers, :count).by(-1)
                                                        .and change(user.answers, :count).by(-1)
    end
  end
end
