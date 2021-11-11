class Attendancerecord < ApplicationRecord
#  has_and_belongs_to_many :players
  belongs_to :event, inverse_of: :attendancerecords
  validates_presence_of :event
  validates :attendancetype, presence: true
  validates :note, presence: true
end
