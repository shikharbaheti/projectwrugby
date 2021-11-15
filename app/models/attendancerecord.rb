class Attendancerecord < ApplicationRecord
    belongs_to :event
    belongs_to :player
    validates :player_id, presence: true
    validates :event_id, presence: true
    validates :note, presence: true
    validates :attendancetype, presence: true
end
