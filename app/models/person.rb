# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :transactions
  validates :uin, presence: true
  validates_length_of :uin, is: 9, message: 'UIN must be 9 digit long'
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates_length_of :phone_number, is: 10, message: 'Phone number must be 10 digit long'
  validates :address, presence: true
  validates :person_type, presence: true
end
