# frozen_string_literal: true

json.extract! attendancerecord, :id, :note, :attendancetype, :created_at, :updated_at
json.url attendancerecord_url(attendancerecord, format: :json)
