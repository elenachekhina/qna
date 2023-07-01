require 'rails_helper'

describe 'Questions API', type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  describe 'GET /api/v1/questions' do
    let(:api_path) { '/api/v1/questions' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    let(:question_public_fields) { %w[id title body created_at updated_at] }

    context 'authorized' do
      let(:access_token) {create(:access_token)}
      let!(:questions) { create_list(:question, 2, author: create(:user)) }
      let(:question) { questions.first }
      let(:question_response) { json['questions'].first }

      before {get api_path, params: {access_token: access_token.token}, headers: headers}

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of questions' do
        expect(json['questions'].size).to eq 2
      end

      it 'returns all public fields' do
        question_public_fields.each do |attr|
          expect(question_response[attr]).to eq question.send(attr).as_json
        end
      end

      it 'does not return anything except public fields' do
        expect(question_response.keys).to match_array( question_public_fields )
      end
    end
  end

  describe 'GET /api/v1/questions/:id' do
    let!(:question) { create(:question, author: create(:user), with_attachment: true) }
    let!(:links) { create_list(:link, 2, linkable: question) }
    let!(:comments) { create_list(:comment, 2, commentable: question) }

    let(:api_path) { "/api/v1/questions/#{question.id}" }
    let(:question_public_fields) { %w[id title body created_at updated_at] }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'authorized' do
      let(:access_token) {create(:access_token)}
      let(:question_response) { json['question'] }

      before {get api_path, params: {access_token: access_token.token}, headers: headers}

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'return public fields' do
        question_public_fields.each do |attr|
          expect(question_response[attr]).to eq question.send(attr).as_json
        end
      end

      it_behaves_like 'Linkable' do
        let(:link) { links.first }
        let(:links_response) { question_response['links'] }
      end

      it_behaves_like 'Commentable' do
        let(:comment) { comments.first }
        let(:comments_response) { question_response['comments'] }
      end

      it_behaves_like 'Attachable' do
        let(:attachs_response) { question_response['attached_files'] }
        let(:attachable) { question }
      end

    end
  end

  describe 'POST /api/v1/questions' do
    let(:api_path) { '/api/v1/questions' }
    let(:access_token) { create(:access_token) }
    let(:headers_with_token) { headers.merge({ 'Authorization' => "Bearer #{access_token.token}" }) }
    let(:method) { :post }
    let(:user) { User.find(access_token.resource_owner_id) }

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      context 'with valid attributes' do
        let(:params) { { question: attributes_for(:question) } }

        it 'returns 200 status' do
          post api_path, params: params, headers: headers_with_token
          expect(response).to be_successful
        end

        it 'creates new question' do
          expect { post api_path, params: params, headers: headers_with_token }.to change(user.questions, :count).by(1)
        end

        it 'creates question with correct fields' do
          post api_path, params: params, headers: headers_with_token
          expect(user.questions.last.title).to eq(params[:question][:title])
          expect(user.questions.last.body).to eq(params[:question][:body])
        end
      end

      context 'with invalid attributes' do
        let(:params) { { question: { title: '', body: '' } } }

        it 'does not create new question' do
          expect { post api_path, params: params, headers: headers_with_token }.not_to change(Question, :count)
        end

        it 'returns an error' do
          post api_path, params: params, headers: headers_with_token
          expect(json).to have_key('errors')
        end
      end
    end
  end

  describe 'PATCH /api/v1/questions/:id' do
    let(:access_token) { create(:access_token) }
    let(:user) { User.find(access_token.resource_owner_id) }
    let!(:question) { create(:question, author: user) }
    let(:other_question) { create(:question, author: create(:user)) }
    let(:api_path) { "/api/v1/questions/#{question.id}" }
    let(:headers_with_token) { headers.merge({ 'Authorization' => "Bearer #{access_token.token}" }) }
    let(:method) { :patch }

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      context 'with valid attributes' do
        let(:params) { { question: { title: 'New title', body: 'New body' } } }

        it 'returns 200 status' do
          patch api_path, params: params, headers: headers_with_token
          expect(response).to be_successful
        end

        it 'update question fields' do
          patch api_path, params: params, headers: headers_with_token
          question.reload
          expect(question.title).to eq(params[:question][:title])
          expect(question.body).to eq(params[:question][:body])
        end
      end

      context 'with invalid attributes' do
        let(:params) { { question: { title: '', body: '' } } }

        it 'does not change the question' do
          patch api_path, params: params, headers: headers_with_token
          question.reload
          expect(question.title).not_to eq(params[:question][:title])
          expect(question.body).not_to eq(params[:question][:body])
        end

        it 'returns an error' do
          patch api_path, params: params, headers: headers_with_token
          expect(json).to have_key('errors')
        end
      end

      context 'user try to change not his answer' do
        let(:params) { { question: { title: 'New title', body: 'New body' } } }
        let(:api_path) { "/api/v1/questions/#{other_question.id}" }

        it 'return an error' do
          patch api_path, params: params, headers: headers_with_token
          expect(json).to have_key('error')
        end
      end

    end
  end

  describe 'DESTROY /api/v1/questions/:id' do
    let(:access_token) { create(:access_token) }
    let(:user) { User.find(access_token.resource_owner_id) }
    let!(:question) { create(:question, author: user) }
    let!(:other_question) { create(:question, author: create(:user)) }
    let(:api_path) { "/api/v1/questions/#{question.id}" }
    let(:headers_with_token) { headers.merge({ 'Authorization' => "Bearer #{access_token.token}" }) }
    let(:method) { :delete }

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      context 'user try to destroy his question' do
        it 'returns 200 status' do
          delete api_path, headers: headers_with_token
          expect(response).to be_successful
        end

        it 'destroy the question' do
          expect { delete api_path, headers: headers_with_token }.to change(Question, :count).by(-1)
        end
      end

      context 'user try to destroy not his question' do
        let(:api_path) { "/api/v1/questions/#{other_question.id}" }

        it 'returns 403 status' do
          delete api_path, headers: headers_with_token
          expect(response.status).to eq 403
        end

        it 'destroy the question' do
          delete api_path, headers: headers_with_token

          expect { delete api_path, headers: headers_with_token }.to change(Question, :count).by(0)
        end
      end

    end
  end

end