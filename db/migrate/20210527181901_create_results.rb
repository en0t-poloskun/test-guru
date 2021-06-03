# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests, table_name: 'results' do |t|
      t.index %i[user_id test_id], unique: true
      t.integer :correct_answers, null: false
      t.integer :incorrect_answers, null: false
      t.boolean :finished, default: true
    end
  end
end
