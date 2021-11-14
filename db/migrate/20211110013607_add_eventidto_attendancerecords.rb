class AddEventidtoAttendancerecords < ActiveRecord::Migration[6.1]
  def change
    add_column :attendancerecords, :event_id, :integer
  end
end
