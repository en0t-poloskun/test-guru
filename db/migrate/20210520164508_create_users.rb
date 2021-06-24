# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :login, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end
