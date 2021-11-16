# frozen_string_literal: true

class CreateRugbyhelps < ActiveRecord::Migration[6.1]
  def change
    create_table :rugbyhelps, &:timestamps
  end
end
