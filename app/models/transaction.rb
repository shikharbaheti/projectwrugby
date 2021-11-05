class Transaction < ApplicationRecord
    belongs_to :merchandise
    validates :transaction_date, presence: true
    validates :amount, presence: true
end
