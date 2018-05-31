module OpenGithubIssue
  module OpenGithubIssueHelper
    def open_github_issue_form
      return unless Constraint.call(self)
      render partial: 'open_github_issue_form'
    end
  end
end
