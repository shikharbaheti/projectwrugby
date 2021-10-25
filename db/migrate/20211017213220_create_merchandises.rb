class CreateMerchandises < ActiveRecord::Migration[6.1]
  def change
    create_table :merchandises do |t|
      t.string :item_name
      t.integer :purchase_price
      t.integer :quantity_on_hand
      t.integer :sell_price
      t.belongs_to :transaction, foreign_key: true
      t.timestamps
    end
  end
end
