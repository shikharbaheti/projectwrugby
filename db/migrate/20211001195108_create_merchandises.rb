# frozen_string_literal: true

class CreateMerchandises < ActiveRecord::Migration[6.1]
  def change
    create_table :merchandises do |t|
      t.string :item_name
      t.integer :purchase_price
      t.integer :quantity_on_hand
      t.integer :sell_price

      t.timestamps
    end
  end
end
