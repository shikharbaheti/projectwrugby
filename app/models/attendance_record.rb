class AttendanceRecord < ApplicationRecord
  belongs_to :person

  validates :attendance_type, presence: true
  validates :note, presence: true

  
end
