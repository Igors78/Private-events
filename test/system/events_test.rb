require 'application_system_test_case'

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test 'visiting the index' do
    visit events_url
    assert_selector 'h1', text: 'Events'
  end

  test 'creating a Event' do
    visit signup_url
    fill_in 'Name', with: 'Chuck'
    click_on 'Create my account'
    visit events_url
    click_on 'New Event'
    fill_in 'Location', with: 'Riga'
    fill_in 'Description', with: 'Description Riga'

    click_on 'Create Event'

    assert_text 'Event has been created!'
    click_on 'Back'
  end

  test 'updating a Event' do
    visit signup_url
    fill_in 'Name', with: 'Chuck'
    click_on 'Create my account'
    visit events_url
    click_on 'New Event'
    fill_in 'Location', with: 'Riga'
    fill_in 'Description', with: 'Description Riga'

    click_on 'Create Event'

    assert_text 'Event has been created!'

    click_on 'Edit'
    click_on 'Update Event'
    assert_text 'Event updated'
    click_on 'Back'
  end

  test 'destroying a Event' do
    visit signup_url
    fill_in 'Name', with: 'Chuck'
    click_on 'Create my account'
    visit events_url
    click_on 'New Event'
    fill_in 'Location', with: 'Riga'
    fill_in 'Description', with: 'Description Riga'

    click_on 'Create Event'

    assert_text 'Event has been created!'

    accept_alert do
      click_on 'Delete'
    end

    assert_text 'Event has been deleted'
  end
end
