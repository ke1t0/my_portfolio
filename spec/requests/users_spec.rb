require 'rails_helper'

# レスポンス確認

RSpec.describe "Users", type: :request do
  describe "GET users_path" do
    let(:user) {create(:user)}

    context "as an admin user" do
      let(:admin_user) {create(:user, :admin)}

      it "returns a 200 response" do
        sign_in admin_user
        get users_path
        expect(response).to have_http_status 200
      end
    end

    context "as an authenticated user who is not an administrator" do
      it "returns a 302 response" do
        sign_in user
        get users_path
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get users_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get users_path
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get users_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET user_path"  do
    let(:user) {create(:user)}

    context "as an authenticated user" do
      it "returns a 200 response" do
        sign_in user
        get user_path(user)
        expect(response).to have_http_status 200
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get user_path(user)
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe  "GET following_user_path" do
    let(:user) {create(:user)}

    context "as an authenticated user" do
      it "returns a 200 response" do
        sign_in user
        get following_user_path(user)
        expect(response).to have_http_status 200
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get following_user_path(user)
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get following_user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe  "GET followers_user_path" do
    let(:user) {create(:user)}

    context "as an authenticated user" do
      it "returns a 200 response" do
        sign_in user
        get followers_user_path(user)
        expect(response).to have_http_status 200
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get followers_user_path(user)
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get followers_user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


  # admin_userが削除できることとかけていない
  describe "DELETE user_registration_path" do
    let(:user) {create(:user)}

    context "users_path" do
      example "ユーザーを削除できること" do
        admin_user = create(:user, :admin)
        sign_in admin_user
        get users_path
        expect {
          delete user_registration_path
        }.to change(User, :count).by(-1)
      end

      it "like count 1" do
        # admin_user = create(:user, :admin)
        # sign_in admin_user
        # get 
      end
  
      it "redirect to root_path after delete" do
        admin_user = create(:user, :admin)
        sign_in admin_user
        get users_path
        delete user_registration_path
        expect(response).to redirect_to root_path
      end
    end
  end
end
