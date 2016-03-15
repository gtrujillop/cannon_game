require 'rails_helper'

RSpec.describe "UserSessionTokens", type: :request do
  describe "GET /user_session_tokens" do
    it "works! (now write some real specs)" do
      get user_session_tokens_path
      expect(response).to have_http_status(200)
    end
  end
end
