class ElasticsearchService
  def initialize(model)
    @client = Elasticsearch::Model.client
    @klass = klass(model)
  end

  def search(query)
    @klass.find(search_elastic(query))
  end

  private

  def search_elastic(query)
    @klass.search("*#{query}*").results.map(&:_id)
  end

  def klass(model)
    model.capitalize.constantize
  end
end