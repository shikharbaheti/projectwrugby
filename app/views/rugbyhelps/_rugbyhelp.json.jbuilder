# frozen_string_literal: true

json.extract! rugbyhelp, :id, :created_at, :updated_at
json.url rugbyhelp_url(rugbyhelp, format: :json)
