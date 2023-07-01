require 'rails_helper'

describe 'Answers API', type: :request do
  let(:headers) {{"CONTENT_TYPE" => "application/json",
                  "ACCEPT" => 'application/json'}}
  let(:answer_public_fields) { %w[id body author_id mark created_at updated_at] }
  let(:question) { create(:question, author: create(:user)) }

  describe 'GET /api/v1/questions/:question_id/answers' do
    let!(:answers) { create_list(:answer, 2, author: create(:user), question: question)}
    let(:api_path) { "/api/v1/questions/#{question.id}/answers" }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'authorized' do
      let(:access_token) {create(:access_token)}
      let(:answer) { answers.first }
      let(:answers_response) { json['answers'] }
      let(:answer_response) { answers_response.first }

      before {get api_path, params: {access_token: access_token.token}, headers: headers}

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of answers' do
        expect(answers_response.size).to eq 2
      end

      it 'returns all public fields' do
        answer_public_fields.each do |attr|
          expect(answer_response[attr]).to eq answer.send(attr).as_json
        end
      end
    end
  end

  describe 'GET /api/v1/answers/:id' do
    let!(:answer) { create(:answer, author: create(:user), question: question, with_attachment: true) }
    let!(:links) { create_list(:link, 2, linkable: answer) }
    let!(:comments) { create_list(:comment, 2, commentable: answer) }

    let(:api_path) { "/api/v1/answers/#{answer.id}" }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'authorized' do
      let(:access_token) {create(:access_token)}
      let(:answer_response) { json['answer'] }

      before {get api_path, params: {access_token: access_token.token}, headers: headers}

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns all public fields' do
        answer_public_fields.each do |attr|
          expect(answer_response[attr]).to eq answer.send(attr).as_json
        end
      end

      it_behaves_like 'Linkable' do
        let(:link) { links.first }
        let(:links_response) { answer_response['links'] }
      end

      it_behaves_like 'Commentable' do
        let(:comment) { comments.first }
        let(:comments_response) { answer_response['comments'] }
      end

      it_behaves_like 'Attachable' do
        let(:attachs_response) { answer_response['attached_files'] }
        let(:attachable) { answer }
      end
    end
  end
end