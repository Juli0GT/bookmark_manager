require 'spec_helper'

feature "tagging links" do
  scenario "a tag is added to a link upon creation" do
    visit "/add"
    fill_in "bookmark_title", with: "Boogle"
    fill_in "bookmark_url", with: "http://boogle.com"
    fill_in "bookmark_tag", with: "#beer"
    click_button "Add"
    expect(page).to have_content("Tags: #beer")
  end
end
