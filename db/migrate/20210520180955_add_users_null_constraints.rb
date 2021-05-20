# frozen_string_literal: true

class AddUsersNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :role, false)
  end
end
