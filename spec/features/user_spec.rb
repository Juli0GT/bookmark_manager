require 'spec_helper'

feature 'creating a user' do
  scenario 'user can sign up' do
    visit '/'
    fill_in 'email', with: 'anna@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content("Welcome anna@gmail.com")
  end
end
