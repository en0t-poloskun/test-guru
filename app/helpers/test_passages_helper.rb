# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    message = test_passage.passed? ? 'Test passed!' : 'Test failed!'
    "<b> #{message} Your result: #{test_passage.result}% </b>".html_safe
  end
end
