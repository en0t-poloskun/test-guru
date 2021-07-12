# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.integer :level, default: 0
      t.integer :timer, default: 15
      t.references :category, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.index %i[name level], unique: true

      t.timestamps
    end
  end
end
