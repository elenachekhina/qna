class Gist < Link
  def body
    GistService.new.gist(url_id)
  end

  private

  def url_id
    path = URI.parse(self.url).path
    File.basename(path)
  end
end
