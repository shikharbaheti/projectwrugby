class CreateAlumnis < ActiveRecord::Migration[6.1]
  def change
    create_table :alumnis do |t|

      t.timestamps
    end
  end
end
