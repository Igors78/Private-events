require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John Wick')
    @event = @user.events.build(description: "Past Event Test Interface.",
      location: "Microverse",
      date: "2020-01-06 10:12:00",
      user_id: @user.id)
  end

  test 'should be valid' do
    assert @event.valid?
  end
end
