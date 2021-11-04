class CreateEncounters < ActiveRecord::Migration[6.1]
  def change
    create_table :encounters do |t|
      t.belongs_to :recruit, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
