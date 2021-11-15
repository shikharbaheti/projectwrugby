# frozen_string_literal: true

class AddPersonIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :person_id, :integer
  end
end
