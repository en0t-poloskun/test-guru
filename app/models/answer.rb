# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_number

  validate :validate_empty_question, on: :update, if: :question_id_changed?

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_number
    errors.add(:question) if question.answers.size >= 4
  end

  def validate_empty_question
    errors.add(:question) if Answer.find(id).question.answers.size == 1
  end
end
