# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(:name) }

  has_many :tests, dependent: :nullify

  validates :name, presence: true
end
