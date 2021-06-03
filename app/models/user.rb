# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  def find_tests(level)
    Test
      .joins('JOIN results ON tests.id = results.test_id')
      .where(results: { user_id: id }, level: level)
  end
end
