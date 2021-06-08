# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results, dependent: :destroy
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  def find_tests(level)
    tests
      .where(level: level)
  end
end
