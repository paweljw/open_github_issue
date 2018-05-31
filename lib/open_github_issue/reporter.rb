module OpenGithubIssue
  class Reporter < BaseService
    def initialize(params, controller)
      @params = params
      @controller = controller
    end

    def call
      GithubIssue.call(title, message)
      true
    rescue Octokit::Error
      false
    end

    private

    attr_reader :controller, :params

    def message
      message = <<-MESSAGE
        **User**: #{name}
        **Path**: #{path}

        ---

        #{body}
      MESSAGE
      message.strip_heredoc
    end

    def title
      params[:title]
    end

    def body
      params[:body]
    end

    def path
      params[:path]
    end

    def user
      user_method = OpenGithubIssue.configuration.user_method
      return unless user_method
      controller.public_send(user_method)
    end

    def name
      user_name_method = OpenGithubIssue.configuration.user_name_method
      return '' unless user_name_method
      user.public_send(user_name_method)
    end
  end
end
