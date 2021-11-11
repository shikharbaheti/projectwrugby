class Event < ApplicationRecord
  has_many :attendancerecords, inverse_of: :event, dependent: :destroy
  accepts_nested_attributes_for :attendancerecords
  validates_associated :attendancerecords
  def attendancerecords
    super || build_attendancerecords([])
  end
end
