# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
