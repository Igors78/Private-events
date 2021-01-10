require 'rails_helper'

RSpec.describe Invite, type: :model do
  subject do
    described_class.new(
      user_id: '',
      event_id: ''
    )
  end
  describe 'associations' do
    it { should belong_to(:invited_user).class_name('User') }
    it { should belong_to(:invited_to_event).class_name('Event') }
  end
end
