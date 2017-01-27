class SearchLogWorker
  include Sidekiq::Worker

  def perform(request_uuid, content, request_ip)
    Search.log(request_uuid, content, request_ip)
  end

end
