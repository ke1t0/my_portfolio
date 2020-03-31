require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) {create(:user)}
  let(:post) {create(:post)}

  describe "GET posts_path" do
    context "as an authenticated user" do
      it "returns a 200 response" do
        sign_in user
        get posts_path
        expect(response).to have_http_status 200
      end
    end

    context "as aguest" do
      it "returns a 302 response" do
        get posts_path
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get posts_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET post_path" do
    context "as an authenticated user" do
      it "returns a 200 response" do
        sign_in post.user
        get post_path(post)
        expect(response).to have_http_status 200
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get post_path(post)
        expect(response).to have_http_status 302
      end

      it "redirects to the login page" do
        get post_path(post)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET new_post" do
    context "as an authenticated user" do
      it "returns a 200 response" do
        sign_in user
        get new_post_path
        expect(response).to have_http_status 200
      end
    end
  end

  describe "POST posts_path" do
    # it "create a post" do
    #   sign_in user
    #   get new_post_path
    #   post_attributes = FactoryBot.attributes_for(:post)
    #   expect {
    #     post posts_path, params: {
    #       body: post_attributes
    #     }
    #   }.to change(user.posts, :count).by(1)
    # end
  end
end
