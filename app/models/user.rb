class User < ApplicationRecord
  has_many :events, inverse_of: :creator, dependent: :destroy
  has_many :invites, inverse_of: :invited_user
  has_many :invited_to_events, through: :invites, class_name: 'Event'
  has_many :attendances, inverse_of: :attendee
  has_many :attended_events, through: :attendances, class_name: 'Event'
  validates :name, presence: true, uniqueness: true
end
