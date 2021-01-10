require 'rails_helper'

RSpec.describe 'Visit index', type: :feature do
  scenario 'users page' do
    visit users_path
    assert_selector 'h1', text: 'All users'
  end
end

RSpec.describe 'Visit home page', type: :feature do
  scenario 'sign up user' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Welcome to the app!'
  end
end

RSpec.describe 'Visit home page', type: :feature do
  scenario 'not allow to duplicate users on sign up' do
    visit root_path
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

RSpec.describe 'Visit home page', type: :feature do
  scenario 'log in user' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Welcome to the app!'
    click_on 'Log out'

    click_on 'Log in'
    fill_in 'Name', with: 'example'
    click_on 'Sign in'
    assert_text 'Successfully Logged In'
  end
end

RSpec.describe 'Visit home page', type: :feature do
  scenario 'delete user' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Welcome to the app!'
    click_on 'Log out'

    click_on 'Log in'
    fill_in 'Name', with: 'example'
    click_on 'Sign in'
    assert_text 'Successfully Logged In'
    accept_alert do
      click_on 'Delete example'
    end
    assert_text 'User deleted'
  end
end
