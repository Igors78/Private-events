require './test/test_helper'

class EventTest < ActiveSupport::TestCase
  fixtures :events, :users
  # def test_truth
  #   assert true
  # end

  def test_should_create_event
    event = Event.new
    event.description = 'Test description'
    event.location = 'Test location'
    event.date = '2020-01-06 10:12:00'
    event.user_id = 1
    assert event.save
  end

  test 'should be valid' do
    event = Event.new
    event.description = "Test description"
    event.location = "Test location"
    event.date = "2020-01-06 10:12:00"
    event.user_id = 1
    assert event.valid?
  end

  def test_should_find_event
    event_id = events(:tiki_party).id
    assert_nothing_raised { Event.find(event_id) }
  end

  def test_should_destroy_event
    event = events(:tiki_party)
    event.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Event.find(event.id) }
  end
end
