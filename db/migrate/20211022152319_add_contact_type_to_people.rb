class AddContactTypeToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :contact_type, :string
    add_column :people, :interest_level, :integer
    add_column :people, :times_contacted, :integer
    add_column :people, :date_contacted, :date
  end
end
