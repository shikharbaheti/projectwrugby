class AddAttendancerecordToPerson < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :attendancerecord, index: true
#    add_index :people, :attendancerecord
  end
end
