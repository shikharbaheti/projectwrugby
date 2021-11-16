# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendancerecords, inverse_of: :event, dependent: :destroy
  has_many :players, through: :attendancerecords

  validates_associated :attendancerecords
  validates_associated :players

  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :address, presence: true
  validates :event_type, presence: true
  validates :score, presence: true
  validates :season, presence: true
  validates :info, presence: true
end
