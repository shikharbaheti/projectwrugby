class CreateMerchandises < ActiveRecord::Migration[6.1]
  def change
    create_table :merchandises do |t|
      t.string :name

      t.timestamps
    end
  end
end
