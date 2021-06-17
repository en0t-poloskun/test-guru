# frozen_string_literal: true

module TestsHelper
  def question_header(test)
    case params[:action]
    when 'new'
      "Create New #{test.name} Question"
    when 'edit'
      "Edit #{test.name} Question"
    end
  end
end
