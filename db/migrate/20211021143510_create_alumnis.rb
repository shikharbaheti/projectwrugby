# frozen_string_literal: true

class CreateAlumnis < ActiveRecord::Migration[6.1]
  def change
    create_table :alumnis, &:timestamps
  end
end
