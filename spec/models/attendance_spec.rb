require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject do
    described_class.new(
      user_id: '',
      event_id: ''
    )
  end
  describe 'associations' do
    it { should belong_to(:attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }
  end
end
