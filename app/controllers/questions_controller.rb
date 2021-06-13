# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  skip_before_action :verify_authenticity_token, only: %i[destroy]

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    render plain: Question.find(params[:id]).body
  end

  def new; end

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy!
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:test_id, :body)
  end
end
