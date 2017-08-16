class UpdatesController < ApplicationController
  before_action{ @title = "Updates" }

  def index
    @updates = content_type_scope.order(created_at: :desc).
               page(params[:page]).per(15)
  end

  def show
    update = content_type_scope.find_by(content_id: params[:id])
    render_content(update.content)
  end

  private

  def content_type_scope
    updates = Update.preload(:content)

    case params[:content_type]
    when "blog"
      updates = updates.where(content_type: "BlogPost")
    when "press"
      updates = updates.where(content_type: "LegalCase")
    when "events"
      updates = updates.where(content_type: "Event")
    when "cases"
      updates = updates.where(content_type: "LegalCase")
    when "whitepapers"
      updates = updates.where(content_type: "Whitepaper")
    end

    updates
  end
end
