class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invites, inverse_of: :invited_to_event, dependent: :destroy
  has_many :invited_users, through: :invites, class_name: 'User'
  has_many :attendances, inverse_of: :attended_event, dependent: :destroy
  has_many :attendees, through: :attendances, class_name: 'User'
  validates :description, :location, :date, presence: true
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
