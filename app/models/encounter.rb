# frozen_string_literal: true

class Encounter < ApplicationRecord
  # Each encounter is linked to a recruit through
  # the recruit_id field.
  belongs_to :recruit
  validates :notes, presence: true
  validates :recruit_id, presence: true
end
