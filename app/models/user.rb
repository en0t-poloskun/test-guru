# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results, dependent: :destroy
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  validates :email, presence: true

  def find_tests(level)
    tests
      .find_level(level)
  end
end
