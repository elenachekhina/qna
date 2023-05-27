require 'rails_helper'

RSpec.describe RewardsController, type: :controller do
  let!(:question) { create(:question, author: create(:user)) }
  let!(:reward) { create(:reward, question: question) }
  let!(:answer_author) { create(:user) }
  let!(:answer) { create(:answer, author: answer_author, question: question, mark: true) }

  describe 'GET #index' do
    before { login(answer_author) }
    before { get :index }

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
