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
end
