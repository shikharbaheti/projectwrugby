# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.integer :dues
      t.string :status

      t.timestamps
    end
  end
end
