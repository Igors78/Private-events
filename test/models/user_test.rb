require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end

  test 'user name should be unique' do
    duplicate_user = @user.dup

    @user.save
    assert_not duplicate_user.valid?
  end

  test 'associated events should be destroyed' do
    @user.save
    @user.events.create!(description: 'Lorem ipsum', location: 'Moscow', date: '2021-01-03 21:07:29')
    assert_difference 'Event.count', -1 do
      @user.destroy
    end
  end
end
