require 'spec_helper'

feature "tagging links" do
  scenario "a tag is added to a link upon creation" do
    visit "/add"
    fill_in "bookmark_title", with: "Boogle"
    fill_in "bookmark_url", with: "http://boogle.com"
    fill_in "bookmark_tag", with: "beer"
    click_button "Add"
    expect(page).to have_content("Tags: #beer")
  end

  scenario "can filter links by tag" do
    LinkTag.create(:link => Link.create(title: "Google", url: "http://google.com"), :tag => Tag.create(name: "search"))
    LinkTag.create(:link => Link.create(title: "Yahoo", url: "http://yahoo.com"), :tag => Tag.create(name: "search"))
    LinkTag.create(:link => Link.create(title: "Makers", url: "http://makersacademy.com"), :tag => Tag.create(name: "coding"))
    visit "/links"
    fill_in "filter_tag", with: "search"
    click_button "Filter tag"
    expect(page).to have_content("Google")
    expect(page).not_to have_content("Makers")
  end

  scenario "a tag is added to a link upon creation" do
    visit "/add"
    fill_in "bookmark_title", with: "Boogle"
    fill_in "bookmark_url", with: "http://boogle.com"
    fill_in "bookmark_tag", with: "beers drinks"
    click_button "Add"
    expect(page).to have_content("Tags: #beers #drinks")
  end

end
