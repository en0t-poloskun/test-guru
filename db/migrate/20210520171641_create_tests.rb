# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :level
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
