require 'octokit'

require 'open_github_issue/engine'

require 'open_github_issue/configuration'
require 'open_github_issue/base_service'
require 'open_github_issue/reporter'
require 'open_github_issue/github_issue'
require 'open_github_issue/constraint'

module OpenGithubIssue
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
