namespace :scraping do
  desc "Fetch the posts from third party api and save into database"
  task save: :environment do
    DatacreationJob.perform_async
  end
end 