# frozen_string_literal: true

class Attendancerecord < ApplicationRecord
  belongs_to :player

  belongs_to :event, inverse_of: :attendancerecords
  validates_presence_of :event
  validates :player_id, presence: true
  validates :attendancetype, presence: true
  # validates :note, presence: true
end
