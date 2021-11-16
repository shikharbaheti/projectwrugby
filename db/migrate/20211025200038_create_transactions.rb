# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.integer :amount

      t.timestamps
    end
  end
end
