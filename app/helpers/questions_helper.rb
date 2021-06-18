# frozen_string_literal: true

module QuestionsHelper
  def question_header(test, question)
    if question.new_record?
      "Create New #{test.name} Question"
    else
      "Edit #{test.name} Question"
    end
  end
end
