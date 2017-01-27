require 'rails_helper'

RSpec.describe SearchesController, type: :controller do

  describe "GET #index" do

    it "should render index template" do
      get :index
      expect(subject).to render_template(:index)
    end

    it "should call searches by count" do
      allow(Search).to receive(:order_by_count)
      get :index
      expect(Search).to have_received(:order_by_count)
    end

    it "should set an instance variable as searches" do
      get :index
      expect(assigns(:searches)).not_to be_nil
    end

  end

  describe "GET #search" do

    it "should send search data to sidekiq worker" do
      expect {
        get :search, params: {request_uuid: "xxxx", content: "How to cancel my subscription"}
      }.to change(SearchLogWorker.jobs, :size).by(1)
    end

  end

  describe "DELETE #destroy_all" do

    it "should delete all" do
      allow(Search).to receive(:destroy_all)
      delete :destroy_all
      expect(Search).to have_received(:destroy_all)
    end

    it "should return index" do
      allow(Search).to receive(:destroy_all)
      delete :destroy_all
      expect(subject).to redirect_to action: :index
    end

  end

end
