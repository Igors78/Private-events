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
    assert_equal 'Event has been created!', flash[:success]
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
    post events_url, params: { event: { id: 1,
                                        user_id: 1,
                                        description: 'A wonderfully good time',
                                        location: "Hampton's Apartment",
                                        date: '2020-01-06 10:12:00' } }
    @event = Event.last
    patch event_url(@event), params: { event: { location: 'Riga' } }
    assert_redirected_to event_url(@event)
    @event.reload
    assert_equal 'Riga', @event.location
  end

  test 'should destroy event' do
    post events_url, params: { event: { id: 1,
                                        user_id: 1,
                                        description: 'A wonderfully good time',
                                        location: "Hampton's Apartment",
                                        date: '2020-01-06 10:12:00' } }
    @event = Event.last
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to root_path
  end
end
