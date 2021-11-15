# frozen_string_literal: true

class Recruit < Person
  has_many :encounters, dependent: :destroy
  validates :contact_type, presence: true
  validates :interest_level, presence: true
  validates :times_contacted, presence: true
  validates :date_contacted, presence: true
end
