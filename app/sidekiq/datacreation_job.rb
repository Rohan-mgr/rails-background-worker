class DatacreationJob
  include Sidekiq::Job

  def perform(title, description)
    # Do something
    # puts title
    Post.create(title: title, description: description)
  end
end
