# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.find_tests_names(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { name: category })
      .order(name: :desc)
      .pluck(:name)
  end
end
