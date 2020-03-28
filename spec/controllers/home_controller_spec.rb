require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "#index" do
    it "return a 200 response" do
      expect(response.status).to eq 200
    end
  end
end
