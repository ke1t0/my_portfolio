require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET searches_user_path" do
    context "as an authenticated user" do
      let(:user) {create(:user)}

      it "return a 200 response" do
        sign_in user
        get searches_user_path
        expect(response).to have_http_status 200
      end
    end

    context "as a guest" do
      it "return a 302 response" do
        get searches_user_path
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get searches_user_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
