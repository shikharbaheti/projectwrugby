# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :person
  belongs_to :merchandise
  validates :merchandise_id, presence: true
  validates :person_id, presence: true
  validates :transaction_date, presence: true
  validates :amount, presence: true
end
