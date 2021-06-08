# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results
  has_many :users, through: :results, dependent: :destroy

  def self.find_tests_names(category)
    joins(:category)
      .where(categories: { name: category })
      .order(name: :desc)
      .pluck(:name)
  end
end
