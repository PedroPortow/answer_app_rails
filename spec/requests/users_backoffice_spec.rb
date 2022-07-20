require 'rails_helper'

RSpec.describe "UsersBackoffices", type: :request do
  describe "GET /test_questions" do
    it "returns http success" do
      get "/users_backoffice/test_questions"
      expect(response).to have_http_status(:success)
    end
  end

end
