class SearchesController < ApplicationController

  def search
    SearchLogWorker.perform_async(params[:request_uuid], params[:content], request.remote_ip)
    respond_to do |format|
      format.html {render :nothing}
      format.json {render json: {data: [], message: "No records found"} }
    end
  end

  private
    def search_params
      params.require(:search).permit(:request_uuid, :content)
    end

end
