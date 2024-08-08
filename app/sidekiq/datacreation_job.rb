require 'sidekiq-scheduler'

class DatacreationJob
  include Sidekiq::Job

  def perform()
    begin
      response = ApiHandler.new.get_posts
      posts = JSON.parse(response.body)
      process_posts(posts)    
    rescue StandardError => e
      puts "Error #{e.message}"
    end  
  end

  private def process_posts(posts)
    posts.each do |post|
      process_post(post)
    end
  end

  private def process_post(post)
    id = post['id']
    title = post['title']
    description = post['body']

    existing_post = Post.find_by(id: id)

    if existing_post
      puts "Skipping existing post with Id #{id}"
    else 
      Post.create(title: title, description: description)
    end
  end
end
