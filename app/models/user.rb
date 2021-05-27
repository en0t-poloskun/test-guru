# frozen_string_literal: true

class User < ApplicationRecord
  def find_tests(level)
    started_tests = Result.where(user_id: id).pluck(:test_id)
    Test.where(level: level, id: started_tests)
  end
end
