# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  validate :validate_answers_number

  private

  def validate_answers_number
    errors.add(:answers) if answers.empty? || (answers.size > 4)
  end
end
