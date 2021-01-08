require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    log_in_as(@user)
    @event = current_user.events.build(id: 1,
                                       user_id: 1,
                                       description: 'A wonderfully good time',
                                       location: "Hampton's Apartment",
                                       date: '2020-01-06 10:12:00')
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_url
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post events_url, params: { event: { id: 1,
                                          user_id: 1,
                                          description: 'A wonderfully good time',
                                          location: "Hampton's Apartment",
                                          date: '2020-01-06 10:12:00' } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test 'should show event' do
    get event_url(@event)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_url(@event)
    assert_response :success
  end

  test 'should update event' do
    patch event_url(@event), params: { event: {} }
    assert_redirected_to event_url(@event)
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
