class Event < ApplicationRecord
  validates :location, :name, :date, presence: true


  belongs_to :creator, class_name: "User"

  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee 


  scope :upcoming_events, -> { where("date >= ?", DateTime.now) }
  scope :past_events, -> { where("date < ?", DateTime.now) }
end
