OpenGithubIssue::Engine.routes.draw do
  post :report, to: 'reports#report', as: :report
end
