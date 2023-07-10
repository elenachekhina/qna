require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let!(:user) { create(:user) }
  let(:question) { create(:question, author_id: user.id) }

  describe 'POST #create' do
    it 'creates new subscription' do
      expect do
        post :create,
             params: { subscription: { subscriber: user,
                                       subscriptable: question } }
      end.to change(Subscription.all, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do

  end
end
