module Updates
  extend ActiveSupport::Concern

  included do
    after_save :create_update
  end

  def create_update
    if published?
      Update.find_or_create_by(content_type: self.class, content_id: id)
    else
      Update.where(content_type: self.class, content_id: id).destroy_all
    end
  end
end
