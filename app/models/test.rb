# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
end
