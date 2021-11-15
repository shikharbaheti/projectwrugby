# frozen_string_literal: true

json.extract! alumni, :id, :created_at, :updated_at
json.url alumni_url(alumni, format: :json)
