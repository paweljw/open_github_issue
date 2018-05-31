module OpenGithubIssue
  class Engine < ::Rails::Engine
    isolate_namespace OpenGithubIssue
    engine_name 'open_github_issue'
  
    config.before_initialize do
      ActiveSupport.on_load(:action_controller_base) { helper(OpenGithubIssue::OpenGithubIssueHelper) }
    end
  end
end
