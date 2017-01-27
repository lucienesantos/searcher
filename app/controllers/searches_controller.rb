class SearchesController < ApplicationController

  def search
    SearchLogWorker.perform_async(params[:request_uuid], params[:content], request.remote_ip)
    render json: {data: [], message: "No records found"}
  end

  def index
    @searches = Search.order_by_count
  end

  def destroy_all
    Search.destroy_all
    redirect_to :action => "index"
  end

end
