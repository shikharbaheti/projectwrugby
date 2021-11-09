class Event < ApplicationRecord
  has_many :attendancerecords, inverse_of: :event
  accepts_nested_attributes_for :attendancerecords

  def attendancerecords
    super || build_attendancerecords([])
  end
end
