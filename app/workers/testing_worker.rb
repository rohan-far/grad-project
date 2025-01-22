class TestingWorker
    include Sidekiq::Worker
  
    def perform(first_name)
        p "Testing #{first_name}"
      Rails.logger.info("Processing job for #{first_name}")
    end
  end