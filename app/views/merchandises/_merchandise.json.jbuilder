# frozen_string_literal: true

json.extract! merchandise, :id, :item_name, :purchase_price, :quantity_on_hand, :sell_price, :created_at, :updated_at
json.url merchandise_url(merchandise, format: :json)
