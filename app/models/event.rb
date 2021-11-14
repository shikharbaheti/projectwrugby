class Event < ApplicationRecord
  has_many :attendancerecords, inverse_of: :event, dependent: :destroy
  has_many :players, through: :attendancerecords
  
  validates_associated :attendancerecords
  validates_associated :players
#  def attendancerecords
#    super || build_attendancerecords([])
#  end
end
