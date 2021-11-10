# frozen_string_literal: true

json.extract! player, :id, :dues, :status, :created_at, :updated_at
json.url player_url(player, format: :json)
