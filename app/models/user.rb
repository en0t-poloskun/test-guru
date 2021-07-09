# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :gists, dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :users_badges
  has_many :badges, through: :users_badges, dependent: :destroy
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :login, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  def find_tests(level)
    tests
      .find_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
