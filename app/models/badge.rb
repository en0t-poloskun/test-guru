# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users_badges
  has_many :users, through: :users_badges, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :rule, presence: true
end
