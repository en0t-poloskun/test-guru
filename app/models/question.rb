# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  validate :validate_empty_question

  private

  def validate_empty_question
    errors.add(:answers) if answers.empty?
  end
end
