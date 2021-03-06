# frozen_string_literal: true

class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.config[:github_token]

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    resource = @client.create_gist(gist_params)
    return unless @client.last_response.status == 201

    Struct.new('GithubResponse', :url)
    Struct::GithubResponse.new(resource[:html_url])
  rescue Octokit::Error
    nil
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_params.description', test_name: @test.name),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
