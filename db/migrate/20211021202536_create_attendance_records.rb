class CreateAttendanceRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :attendance_records do |t|
      t.string :record_date
      t.string :attendance_type
      t.text :note
      t.integer :person_id
      t.timestamps
    end
  end
end
