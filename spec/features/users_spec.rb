require 'rails_helper'

RSpec.feature "Users", type: :feature, js: true do

  scenario "admin user can delete users" do
    user = create(:user, :admin)
    sign_in user
    visit users_path
    click_link "削除"
    expect {
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content("アカウント登録もしくはログインしてください。")
    }.to change(User, :count).by(-1)
  end

  scenario "admin user can delete other_user" do
    user = create(:user, :admin)
    create(:user)
    sign_in user
    visit users_path

    all('tr td')[7].click_link '削除'
    expect {
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content("管理者のみのページ")
    }.to change(User, :count).by(-1)
  end

  scenario "The deletion dialog is correct"do
    user = create(:user, :admin)
    sign_in user
    visit users_path
    click_link "削除"
    expect(page.driver.browser.switch_to.alert.text).to eq "削除しますか？"
  end

  scenario "Click on name to go to user page" do
    user = create(:user, :admin)
    other_user = User.find_by(name: "Admin User")
    sign_in user
    visit users_path
    click_link "Test User"
    expect(page).to have_content "Test User"
  end
end
