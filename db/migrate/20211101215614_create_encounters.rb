# frozen_string_literal: true

class CreateEncounters < ActiveRecord::Migration[6.1]
  def change
    create_table :encounters do |t|
      t.text :notes
      t.integer :recruit_id

      t.timestamps
    end
  end
end
