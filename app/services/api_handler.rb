require 'httparty'

class ApiHandler
  include HTTParty
  base_uri ENV['JSONPLACEHOLDER_BASEURL']

  def initialize
    @options = {}
  end

  def get_posts
    self.class.get('/posts', @options)
  end
end