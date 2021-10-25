class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.integer :person_id
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.integer :person_type

      t.timestamps
    end
  end
end
