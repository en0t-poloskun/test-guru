# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    flash_options = if github_response && !github_response.url.empty?
                      Gist.create!(question: @test_passage.current_question, url: github_response.url,
                                   user: current_user)
                      { notice: t('.success',
                                  link: view_context.link_to(t('.link_text'), github_response.url)).html_safe }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def github_response
    GistQuestionService.new(@test_passage.current_question).call
  end
end
