# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_tests(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @result = test_passage.result

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end
end
