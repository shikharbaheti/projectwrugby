# frozen_string_literal: true

class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.string :contact_type
      t.integer :interest_level
      t.integer :times_contacted
      t.date :date_contacted

      t.timestamps
    end
  end
end
