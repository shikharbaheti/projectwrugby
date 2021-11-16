class CreateRugbyhelps < ActiveRecord::Migration[6.1]
  def change
    create_table :rugbyhelps do |t|

      t.timestamps
    end
  end
end
