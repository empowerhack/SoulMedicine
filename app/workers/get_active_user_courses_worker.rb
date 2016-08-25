class GetActiveUserCoursesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false
  def perform(user)
      logger.info "Gathering courses for user #{user}"
  end
end