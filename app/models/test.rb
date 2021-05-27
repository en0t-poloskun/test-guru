# frozen_string_literal: true

class Test < ApplicationRecord
  def self.find_tests_names(category)
    category = Category.find_by(name: category)
    Test.where(category_id: category.id).order(name: :desc).pluck(:name)
  end
end
