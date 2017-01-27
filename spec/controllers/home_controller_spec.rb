require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do

    it "should render index template" do
      get :index
      expect(subject).to render_template(:index)
    end

  end
end
