module OpenGithubIssue
  class Constraint < BaseService
    def initialize(controller)
      @controller = controller
    end

    def call
      constraint_proc.call(user)
    end

    private

    def constraint_proc
      @constraint_proc ||= OpenGithubIssue.configuration.constraint
    end

    def user
      user_method = OpenGithubIssue.configuration.user_method
      return unless user_method
      @controller.public_send(user_method)
    end
  end
end
