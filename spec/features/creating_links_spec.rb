require 'spec_helper'

feature "save a website" do
  scenario "add a site's address and title to bookmarks page" do
    visit '/add'
    fill_in "bookmark_title", with: "Google"
    fill_in "bookmark_url", with: "http://google.com"
    click_button "Add"
    expect(page).to have_content("Google")
  end
end
