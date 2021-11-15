# frozen_string_literal: true

class AddMerchandiseIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :merchandise_id, :integer
  end
end
