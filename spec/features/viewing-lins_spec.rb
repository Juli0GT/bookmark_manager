require 'spec_helper'

feature 'viewing links' do
  scenario 'viewing links on the homepage' do
    visit '/'

    expect(page).to have_content('Bookmark1')
  end
end
