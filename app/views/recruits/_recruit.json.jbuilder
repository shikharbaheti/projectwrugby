# frozen_string_literal: true

json.extract! recruit, :id, :contact_type, :interest_level, :times_contacted, :date_contacted, :created_at, :updated_at
json.url recruit_url(recruit, format: :json)
