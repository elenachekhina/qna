require 'rails_helper'

describe 'Questions API', type: :request do
  let(:headers) {{"CONTENT_TYPE" => "application/json",
                  "ACCEPT" => 'application/json'}}

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
end