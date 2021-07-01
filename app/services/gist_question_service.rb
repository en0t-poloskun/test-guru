# frozen_string_literal: true

class GistQuestionService
  TOKEN = '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'

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.name} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
