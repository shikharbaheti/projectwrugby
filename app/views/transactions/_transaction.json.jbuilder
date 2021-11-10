# frozen_string_literal: true

json.extract! transaction, :id, :transaction_date, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
