# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator
end
