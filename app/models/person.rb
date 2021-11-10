# frozen_string_literal: true

class Person < ApplicationRecord
  validates :uin, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :person_type, presence: true
end
