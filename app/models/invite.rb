class Invite < ApplicationRecord
  belongs_to :invited_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :invited_to_event, class_name: 'Event', foreign_key: 'event_id'
end
