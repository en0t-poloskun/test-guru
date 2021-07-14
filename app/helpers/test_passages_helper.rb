# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    return 'Test failed! Time is over!' unless test_passage.finished?

    message = test_passage.passed? ? 'passed' : 'failed'
    "Test #{message}! Your result: <span class=\"#{message}\">#{test_passage.result}% </span>".html_safe
  end
end
