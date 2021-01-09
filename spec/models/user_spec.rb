require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Chuck')
  end

  describe 'associations' do
    it { should have_many(:events).class_name(:Event) }
    it { should have_many(:invites).class_name(:Invite) }
    it { should have_many(:attendances).class_name(:Attendance) }
    it { should have_many(:invited_to_events).through(:invites).class_name(:Event) }
    it { should have_many(:attended_events).through(:attendances).class_name(:Event) }
  end

  describe 'validations' do
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
