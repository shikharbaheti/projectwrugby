class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.integer :uin
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :person_type
      t.integer :dues
      t.string :status
      
      t.timestamps
    end
  end
end
