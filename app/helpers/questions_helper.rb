# frozen_string_literal: true

module QuestionsHelper
  def question_header(test, question)
    if question.new_record?
      t('.header', test: test.name)
    else
      t('.header', test: test.name)
    end
  end
end
