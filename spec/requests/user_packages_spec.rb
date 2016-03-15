require 'rails_helper'

RSpec.describe "UserPackages", type: :request do
  describe "GET /user_packages" do
    it "works! (now write some real specs)" do
      get user_packages_path
      expect(response).to have_http_status(200)
    end
  end
end
