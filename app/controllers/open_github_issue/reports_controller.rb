module OpenGithubIssue
  class ReportsController < ApplicationController
    def report
      if Constraint.call(self) && Reporter.call(permitted_params, self)
        flash[:notice] = t('open_github_issue.thanks')
      else
        flash[:alert] = t('open_github_issue.error')
      end

      redirect_to permitted_params[:path]
    end

    private

    def permitted_params
      params.require(:open_github_report).permit(:title, :body, :path)
    end
  end
end
