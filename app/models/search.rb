class Search < ApplicationRecord

  #validations
  validates :request_uuid, :content, :request_ip, presence: true


  def self.log(request_uuid, content, request_ip)
    
    search = Search.find_by_request_uuid(request_uuid)

    if search
      search.update(content: content)
    else
      Search.create(request_uuid: request_uuid, content:content, request_ip:request_ip)
    end
  end

end
