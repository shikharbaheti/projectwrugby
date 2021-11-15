# frozen_string_literal: true

json.extract! encounter, :id, :notes, :recruit_id, :created_at, :updated_at
json.url encounter_url(encounter, format: :json)
