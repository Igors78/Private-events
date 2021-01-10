require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.new(name: 'Chuck') }
  subject do
    described_class.new(description: 'Description',
                        date: DateTime.now,
                        location: 'Riga')
  end
  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:invites).class_name('Invite') }
    it { should have_many(:attendances).class_name('Attendance') }
    it { should have_many(:attendees).through(:attendances).class_name(:User) }
    it { should have_many(:invited_users).through(:invites).class_name(:User) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:location) }
  end
end
