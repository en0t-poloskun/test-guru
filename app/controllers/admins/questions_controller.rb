# frozen_string_literal: true

module Admins
  class QuestionsController < Admins::BaseController
    before_action :find_test, only: %i[create new]
    before_action :find_question, only: %i[show destroy edit update]
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

    def show; end

    def new
      @question = Question.new
    end

    def edit; end

    def create
      @question = @test.questions.build(question_params)
      if @question.save
        redirect_to @question
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to @question
      else
        render :edit
      end
    end

    def destroy
      @question.destroy!
      redirect_to @question.test
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
end
