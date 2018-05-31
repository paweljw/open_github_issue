module OpenGithubIssue
  class GithubIssue < BaseService
    def initialize(title, message)
      @title = title
      @message = message
    end

    def call
      client.create_issue(repo, @title, @message)
    end

    def client
      @client ||= Octokit::Client.new(access_token: OpenGithubIssue.configuration.github_access_token)
    end

    def repo
      @repo ||= OpenGithubIssue.configuration.github_repo
    end
  end
end
