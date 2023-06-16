# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OauthCallbacksController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'Github' do
    let(:oauth_data) { {'provider' => 'github', 'uid' => 123 } }

    it 'call method to find user' do
      allow(request.env).to receive(:[]).and_call_original
      allow(request.env).to receive(:[]).with('omniauth.auth').and_return(oauth_data)

      authorization_service = instance_double(AuthorizationService)
      expect(AuthorizationService).to receive(:new).with(oauth_data).and_return(authorization_service)
      expect(authorization_service).to receive(:call)

      get :github
    end

    context 'user exists' do
      let!(:user) { create(:user) }

      before do
        allow(request.env).to receive(:[]).and_call_original
        allow(request.env).to receive(:[]).with('omniauth.auth').and_return(oauth_data)
        authorization_service = instance_double(AuthorizationService)
        allow(AuthorizationService).to receive(:new).with(oauth_data).and_return(authorization_service)
        allow(authorization_service).to receive(:call).and_return(user)

        get :github
      end

      it 'login user' do
        expect(subject.current_user).to eq user
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context 'user does not exist' do
      before do
        allow(request.env).to receive(:[]).and_call_original
        allow(request.env).to receive(:[]).with('omniauth.auth').and_return(oauth_data)
        authorization_service = instance_double(AuthorizationService)
        allow(AuthorizationService).to receive(:new).with(oauth_data).and_return(authorization_service)
        allow(authorization_service).to receive(:call)

        get :github
      end

      it 'does not login user' do
        expect(subject.current_user).not_to be
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

  end

end
