# frozen_string_literal: true

json.array! @attendancerecords, partial: 'attendancerecords/attendancerecord', as: :attendancerecord
