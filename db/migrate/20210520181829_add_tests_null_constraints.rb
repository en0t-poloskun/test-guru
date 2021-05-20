# frozen_string_literal: true

class AddTestsNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :name, false)
  end
end
