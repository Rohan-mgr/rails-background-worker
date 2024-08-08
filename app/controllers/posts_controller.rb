require 'json'

class PostsController < ApplicationController
  def index
    @response = ApiHandler.new.get_posts
    @data = JSON.parse(@response.body)

    @data.each do |post|
      DatacreationJob.perform_async(post['title'], post['body'])
    end
  end
end
