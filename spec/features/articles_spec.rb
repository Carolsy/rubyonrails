require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  scenario "user creates a new article" do
    user = FactoryBot.create(:user)
    visit root_path
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    expect {
      click_link "新編"
      fill_in "Title", with: "Testt"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Article"
      expect(page).to have_content "保存しました!"
      expect(page).to have_content "Title: Testt"
      expect(page).to have_content "Description: Trying out Capybara"
    }.to change(user.articles, :count).by(1)
  end
end
