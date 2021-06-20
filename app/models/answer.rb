# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_number, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_number
    errors.add(:question) if question.answers.size > 4
  end
end
