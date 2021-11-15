# frozen_string_literal: true

class Player < Person
  validates :dues, presence: true
  validates :status, presence: true
end
