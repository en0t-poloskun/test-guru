# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  validates :name, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :name, uniqueness: { scope: :level }

  scope :find_level, ->(level) { where(level: level) }
  scope :easy, -> { find_level(0..1) }
  scope :medium, -> { find_level(2..4) }
  scope :hard, -> { find_level(5..Float::INFINITY) }
  scope :find_category, ->(category) { joins(:category).where(categories: { name: category }).order(name: :desc) }

  def self.find_tests_names(category)
    find_category(category)
      .pluck(:name)
  end
end
