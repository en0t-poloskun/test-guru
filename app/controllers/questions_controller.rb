# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    redirect_to @test
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy!
    redirect_to test_questions_url(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.to_s
  end
end
