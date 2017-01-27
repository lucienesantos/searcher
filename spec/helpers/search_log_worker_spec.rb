require 'rails_helper'

RSpec.describe SearchLogWorker do

  describe "#perform" do
    let(:uuid) {"xxxx"}
    let(:content) {"how to test it"}
    let(:request_ip) {"127.0.0.1"}

    it "should call search to log in database" do
      allow(Search).to receive(:log).with(uuid, content, request_ip)
      SearchLogWorker.new.perform(uuid, content, request_ip)
      expect(Search).to have_received(:log).with(uuid, content, request_ip)
    end
  end

end
