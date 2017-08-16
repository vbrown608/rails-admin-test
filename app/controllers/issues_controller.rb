class IssuesController < ApplicationController
  before_action{ @title = find_issue.title }

  def show
    @issue = find_issue
    @related_content = @issue.related_content.order(created_at: :desc).
                       page(params[:page]).per(15)
  end

  protected

  def find_issue
    @issue ||= Issue.find(params[:id])
  end
end
