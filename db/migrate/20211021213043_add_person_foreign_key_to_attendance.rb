class AddPersonForeignKeyToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :attendance_records, :people
  end
end
