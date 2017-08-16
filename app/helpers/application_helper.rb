module ApplicationHelper
  def summarize(content)
    truncate(sanitize(content.body, tags: %w(a em strong)), length: 300, escape: false, ommission: "")
  end

  def user_content_allowed_tags
    %w(h2 h3 ol ul li table thead tbody tr th td strong em u a p blockquote code pre img)
  end
end
