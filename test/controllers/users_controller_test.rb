require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should show profile' do
    # helper is now reusable from any controller test case
    @user = users(:one)
    log_in_as(@user)

    get user_path(@user)
    assert_response :success
  end
end
