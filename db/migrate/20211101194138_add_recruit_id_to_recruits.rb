class AddRecruitIdToRecruits < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :recruit_id, :int
  end
end
