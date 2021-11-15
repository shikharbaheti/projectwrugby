# frozen_string_literal: true

class Event < ApplicationRecord
<<<<<<< HEAD
  has_many :attendancerecords
=======
  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :address, presence: true
  validates :event_type, presence: true
  validates :score, presence: true
  validates :season, presence: true
  validates :info, presence: true
>>>>>>> c037be34ba6fe8ba0e7eb6edd5684b28a3fc8203
end
