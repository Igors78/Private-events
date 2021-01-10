require 'rails_helper'

RSpec.describe 'Visit index', type: :feature do
  scenario 'users page' do
    visit users_url
    assert_selector 'h1', text: 'All users'
  end
end
RSpec.describe 'Visit home page', type: :feature do
  scenario 'sign up user' do
    visit root_url
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Welcome to the app!'
  end
end
RSpec.describe 'Visit home page', type: :feature do
  scenario 'not allow to duplicate users on sign up' do
    visit root_url
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Welcome to the app!'
    click_on 'Log out'
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Name has already been taken'
  end
end
