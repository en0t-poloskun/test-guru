# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results
  has_many :users, through: :results, dependent: :destroy

  scope :find_level, ->(level) { where(level: level) }
  scope :easy, -> { find_level(0..1) }
  scope :medium, -> { find_level(2..4) }
  scope :hard, -> { find_level(5..Float::INFINITY) }

  def self.find_tests_names(category)
    joins(:category)
      .where(categories: { name: category })
      .order(name: :desc)
      .pluck(:name)
  end
end
