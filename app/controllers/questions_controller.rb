# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show destroy]
  skip_before_action :verify_authenticity_token, only: %i[destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    @question.destroy!
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:test_id, :body)
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.to_s
  end
end
