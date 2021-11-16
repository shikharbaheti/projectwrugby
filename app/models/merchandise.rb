# frozen_string_literal: true

class Merchandise < ApplicationRecord
  has_many :transactions
  validates :item_name, presence: true
  validates :purchase_price, presence: true
  validates :quantity_on_hand, presence: true
  validates :sell_price, presence: true
end
