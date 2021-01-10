require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit users_url

    assert_selector 'h1', text: 'All users'
  end

  test 'sign up the user' do
    visit root_url
    click_on 'Sign up'
    fill_in 'Name', with: 'example'
    click_on 'Create my account'
    assert_text 'Welcome to the app!'
  end

  test 'not allow to duplicate users on sign up' do
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

  test 'login test' do
    visit root_url
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
  test 'delete user' do
    visit root_url
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
