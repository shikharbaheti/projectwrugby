# frozen_string_literal: true

json.extract! person, :id, :person_id, :name, :email, :phone_number, :address, :person_type, :created_at, :updated_at
json.url person_url(person, format: :json)
