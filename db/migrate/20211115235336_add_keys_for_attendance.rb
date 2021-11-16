# frozen_string_literal: true

class AddKeysForAttendance < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :attendancerecord, index: true
    add_reference :players, :attendancerecord, index: true
    add_reference :attendancerecords, :event, index: true
  end
end
