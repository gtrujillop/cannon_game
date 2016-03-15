require 'rails_helper'

RSpec.describe "SessionResources", type: :request do
  describe "GET /session_resources" do
    it "works! (now write some real specs)" do
      get session_resources_path
      expect(response).to have_http_status(200)
    end
  end
end
