class Invitation < ApplicationRecord

  validates :attended_event_id, uniqueness: { scope: :attendee_id }

  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendee, class_name: "User"
end
