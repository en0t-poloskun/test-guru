# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result
                      Gist.create!(question: @test_passage.current_question, url: result[:html_url], user: current_user)
                      { notice: "Gist was successfully created!
                      #{view_context.link_to('View', result[:html_url], target: '_blank', rel: 'nofollow')}" }
                    else
                      { notice: 'An error occurred while saving gist' }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_tests(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
