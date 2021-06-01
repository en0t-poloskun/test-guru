# frozen_string_literal: true

class Test < ApplicationRecord
  def self.find_tests_names(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.name': category)
        .order(name: :desc).pluck(:name)
  end
end
