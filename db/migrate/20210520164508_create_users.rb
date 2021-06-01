# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :login, null: false
      t.string :password, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end