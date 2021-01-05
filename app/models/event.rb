class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invites, inverse_of: :invited_to_meeting
  has_many :invited_users, through: :invites, class_name: 'User'
  validates :content, :location, :date, presence: true
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
