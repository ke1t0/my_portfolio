require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "create a post" do
    user = create(:user)
    expect {
      sign_in user
      visit new_post_path
      fill_in "post_body", with: "hello, world"
      click_button "投稿"
    }.to change(user.posts, :count).by(1)
  end

  scenario "create a post with image" do
    user = create(:user)
    sign_in user
    visit new_post_path
    expect {
      fill_in 'post_body', with: "Hello, world"
      attach_file "spec/fixtures/files/kitten.jpg"
      click_button "投稿"
    }.to change(user.posts, :count).by(1)
  end
end
