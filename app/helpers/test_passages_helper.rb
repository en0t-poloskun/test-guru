# frozen_string_literal: true

module TestPassagesHelper
  def result_message(result)
    if result < 85
      message = 'Test failed!'
      color = 'red'
    else
      message = 'Test passed!'
      color = 'green'
    end
    "<b> #{message} Your result: <font color=\"#{color}\">#{result}%</font> </b>".html_safe
  end
end
