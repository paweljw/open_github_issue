# frozen_string_literal: true

module OpenGithubIssue
  class Configuration
    attr_accessor :github_access_token, :github_repo, :user_method, :user_name_method, :constraint

    def initialize
      self.user_method = :current_user
      self.user_name_method = :email
      self.constraint = proc { |user| user }
    end
  end
end
