# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :method, null: false
      t.string :argument, null: false

      t.timestamps
    end
  end
end
