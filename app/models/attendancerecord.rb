class Attendancerecord < ApplicationRecord
    belongs_to :event
    has_many :players
    validates :event_id, presence: true
    validates :note, presence: true
    validates :attendancetype, presence: true
end
