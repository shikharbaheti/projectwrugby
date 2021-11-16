# frozen_string_literal: true

class Player < Person
  validates :dues, presence: true
  validates :status, presence: true
  # belongs_to :person, foreign_key: :parent_id
  has_many :attendancerecords
end
