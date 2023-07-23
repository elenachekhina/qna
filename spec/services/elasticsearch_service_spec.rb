require 'rails_helper'

RSpec.describe ElasticsearchService do
  describe '#initialize' do
    it 'initializes with model and assigns @client and @klass' do
      model = 'question'
      client = double
      klass = model.capitalize.constantize

      allow(Elasticsearch::Model).to receive(:client).and_return(client)

      service = ElasticsearchService.new(model)

      expect(service.instance_variable_get(:@client)).to eq(client)
      expect(service.instance_variable_get(:@klass)).to eq(klass)
    end
  end

  describe '#search' do
    let(:model) { 'question' }
    let(:service) { ElasticsearchService.new(model) }
    let(:query) { 'body' }
    let(:search_result) { double }

    it 'calls search_elastic and returns search result' do
      allow(service).to receive(:search).with(query).and_return(search_result)

      expect(service.search(query)).to eq(search_result)
    end
  end
end