class Event < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates :time, presence: true
    validates :address, presence: true
end
