# frozen_string_literal: true

class GistService
  def initialize(client: nil)
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials[Rails.env.to_sym][:gist][:github_access_token])
  end

  def gist(gist_id)
    @client.gist(gist_id)[:files].map { |name, value| "#{name}: #{value[:content]}" }.join('\n')
  end
end
