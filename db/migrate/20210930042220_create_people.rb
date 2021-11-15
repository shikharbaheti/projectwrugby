# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.integer :uin
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :person_type
      t.integer :dues
      t.string :status
      t.string :contact_type
      t.integer :interest_level
      t.integer :times_contacted
      t.date :date_contacted

      t.timestamps
    end
  end
end
