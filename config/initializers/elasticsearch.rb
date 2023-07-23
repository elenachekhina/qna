host = Rails.application.credentials[Rails.env.to_sym][:elasticsearch][:host]

Elasticsearch::Model.client = Elasticsearch::Client.new(url: host, log: true)
