require 'rails_helper'

RSpec.describe Search, type: :model do

  context "Validations" do
    it {is_expected.to validate_presence_of(:request_uuid)}
    it {is_expected.to validate_presence_of(:content)}
    it {is_expected.to validate_presence_of(:request_ip)}
  end

  describe "#log" do

    context "There is no log for this content with this request uuid " do

      let(:request_uuid) {"79c546b0-cbc6-4ea4-bf01-f79329bb0exx"}
      let(:content) {"how do"}
      let(:request_ip) {"127.0.0.1"}

      it "should create a log for this search" do
        Search.log(request_uuid, content, request_ip)
        search = Search.find_by_request_uuid(request_uuid)
        expect(search.content).to eq("how do")
      end

    end

    context "There is log for this content with this request uuid " do

      let(:request_uuid) {"79c546b0-cbc6-4ea4-bf01-f79329bb0exx"}
      let(:request_ip) {"127.0.0.1"}
      let(:content) {"how do"}

      let(:content_update) {"how do I start project"}

      before do
        Search.log(request_uuid, content, request_ip)
      end

      it "should update the log this search" do

        Search.log(request_uuid, content_update, request_ip)
        search = Search.find_by_request_uuid(request_uuid)
        expect(search.content).to eq("how do I start project")
      end
    end
  end

  describe "#order_by_count" do
    before do
      FactoryGirl.create_list(:search, 50, content: "How do I signup")
      FactoryGirl.create_list(:search, 25, content: "How do I cancel my subscription")
      FactoryGirl.create_list(:search, 30, content: "how do i CANCEL MY SUBSCRIPTION")
      FactoryGirl.create_list(:search, 100, content: "How do I find my lost articles")
    end

    let(:expected_result) { {"how do i find my lost articles"=>100, "how do i cancel my subscription"=>55, "how do i signup"=>50} }

    it "should return the searchs group by content and order by count"  do
      searches = Search.order_by_count
      expect(searches).to eq(expected_result)
    end
  end

end
