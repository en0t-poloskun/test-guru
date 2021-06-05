# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test'

  def find_tests(level)
    Test
      .joins('JOIN results ON tests.id = results.test_id')
      .where(results: { user_id: id }, level: level)
  end
end
