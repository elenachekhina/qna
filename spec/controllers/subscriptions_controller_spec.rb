require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let!(:user) { create(:user) }
  let(:question) { create(:question, author_id: user.id) }

  before { login(user) }

  describe 'POST #create', js: true do
    it 'creates new subscription' do
      expect do
        post :create,
             params: { subscription: { subscriptable_type: question.class, subscriptable_id: question.id }, format: :turbo_stream }
      end.to change(Subscription.all, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let!(:subscription) { create(:subscription, subscriber: user, subscriptable: question) }

    it 'delete subscription' do
      expect do
        delete :destroy, params: { id: subscription, format: :turbo_stream }
      end.to change(Subscription.all, :count).by(-1)
    end
  end
end
