require 'rails_helper'

RSpec.describe "Homes", type: :request do
  context "GET root_path" do
    it "returns 200 a response" do
      get root_path
      expect(response).to have_http_status 200
    end
  end
end
