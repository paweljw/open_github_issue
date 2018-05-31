Rails.application.routes.draw do
  mount OpenGithubIssue::Engine => "/open_github_issue"
end
