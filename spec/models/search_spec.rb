require 'rails_helper'

RSpec.describe Search, type: :model do

  context "Validations" do
    it {is_expected.to validate_presence_of(:request_uuid)}
    it {is_expected.to validate_presence_of(:content)}
    it {is_expected.to validate_presence_of(:request_ip)}
  end

  describe "#self.log" do

    context "Many pause to digitize the search" do
      request_uuid = "79c546b0-cbc6-4ea4-bf01-f79329bb0exx"

      before do
        request_ip = "123"

        content_one = "how do"
        content_two = "how do I"
        content_tree = "how do I start project"

        Search.log(request_uuid, content_one, request_ip)
        Search.log(request_uuid, content_two, request_ip)
        Search.log(request_uuid, content_tree, request_ip)
      end

      it "should return last content typed" do
        search = Search.find_by_request_uuid(request_uuid)
        expect(search.content).to eq("how do I start project")
      end
    end
  end

end
