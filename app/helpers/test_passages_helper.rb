# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    message = test_passage.passed? ? 'passed' : 'failed'
    "<b>Test #{message}! Your result: <span class=\"#{message}\">#{test_passage.result}% </span></b>".html_safe
  end
end
