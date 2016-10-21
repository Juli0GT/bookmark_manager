require 'spec_helper'

feature 'viewing links' do
  scenario 'viewing links on the homepage' do

    Link.create(title: 'Bookmark1', url: 'www.bookmark.com' )

    visit '/links'

    expect(page).to have_content('Bookmark1')
  end
end
